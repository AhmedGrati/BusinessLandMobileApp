import 'dart:async';

import 'package:businessland_app/models/api_response.dart';
import 'package:businessland_app/models/gender.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'register_validation.dart';
import 'package:rxdart/rxdart.dart';
class RegisterValidationBloc extends Object with RegisterValidaton implements BaseBloc{

  UserService get userService => GetIt.I<UserService>();

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmationController = BehaviorSubject<String>();
  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _usernameController = BehaviorSubject<String>();
  final _ageController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get passwordConfirmationChanged => _passwordConfirmationController.sink.add;
  Function(String) get firstNameChanged => _firstNameController.sink.add;
  Function(String) get lastNameChanged => _lastNameController.sink.add;
  Function(String) get usernameChanged => _usernameController.sink.add;
  Function(String) get ageChanged => _ageController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<String> get firstName => _firstNameController.stream.transform(firstNameValidator);
  Stream<String> get lastName => _lastNameController.stream.transform(lastNameValidator);
  Stream<String> get username => _usernameController.stream.transform(usernameValidator);
  Stream<int> get age => _ageController.stream.transform(ageValidator);
  Stream<String> get passwordConfirmation => _passwordConfirmationController.stream.transform(
      StreamTransformer<String,String>.fromHandlers(
          handleData: (passwordConfirmation,sink) {
            if(passwordConfirmation.length > 5) {
              if(passwordConfirmation == _passwordController.value) {
                sink.add(passwordConfirmation);
              }else{
                sink.addError("Password Confirmation and password should match.");
              }
            }else{
              sink.addError("Password Confirmation length should be greater than 5.");
            }
          }
      )
  );

  Stream<bool> get submitRegisterCheck => Rx.combineLatest7(
      email, password, firstName, lastName, username, passwordConfirmation,age ,  (a, b, c, d, e, g,f) => true);


  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmationController?.close();
    _firstNameController?.close();
    _lastNameController?.close();
    _usernameController?.close();
    _ageController?.close();
  }

  Future<ApiResponse<bool>> register(Gender gender) async {
    User user = User(
      gender: gender,
      username: _usernameController.value,
      email: _emailController.value,
      age:int.parse( _ageController.value),
      password: _passwordController.value,
      firstName: _firstNameController.value,
      lastName: _lastNameController.value,
    );

    final result = await this.userService.registerUser(user);
    return result;
  }

  Future<ApiResponse<User>> loginAfterRegister() async {
    final result = await this.userService.login(LoginModel(
        email: _emailController.value,
        password: _passwordController.value
    ));
    return result;
  }

}

abstract class BaseBloc {
  void dispose();
}