import 'dart:async';

import 'package:businessland_app/models/api_response.dart';
import 'package:businessland_app/models/gender.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:businessland_app/state_management_blocks/blocs/register_bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'login_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
class LoginValidationBloc extends Object with Validator implements BaseBloc {

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  UserService get userService => GetIt.I<UserService>();

  Function(String) get emailChanged => _emailController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);

  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get submitLoginCheck =>
      Rx.combineLatest2(email, password, (a, b) => true);


  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

  Future<ApiResponse<User>> login() async {
      final result = await this.userService.login(LoginModel(
          email: _emailController.value,
          password: _passwordController.value
      ));
      return result;
  }
}