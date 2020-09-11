import 'package:businessland_app/models/api_response.dart';
import 'package:businessland_app/models/gender.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:businessland_app/state_management_blocks/blocs/register_bloc/register_bloc.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'auth_card_widget.dart';
import 'custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_auth_button.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  FToast fToast;
  Gender _gender = Gender.male;
  UserService get userService => GetIt.I<UserService>();

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  double defaultSize = SizeConfig.defaultSize;
  @override
  Widget build(BuildContext context) {
    fToast = FToast(context);
    final RegisterValidationBloc registerValidationBloc = RegisterValidationBloc();
    return  Consumer<ModeBlock>(
      builder: (context , modeBlock , children) {
        return AuthCardWidget(
          color: modeBlock.primaryColor,
          height:  defaultSize * 144,
          content: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Create your Account!' ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        color: modeBlock.secondaryColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                    stream: registerValidationBloc.firstName,
                    builder: (context , snapshot) {
                      return CustomAuthInput(
                        textColor: modeBlock.secondaryColor,
                        fillColor: modeBlock.primaryColor,
                        changeFunction: registerValidationBloc.firstNameChanged,
                        labelText: "First Name",
                        isObscure: false,
                        errorText: snapshot.error,
                      );
                    }
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                      stream: registerValidationBloc.lastName,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          changeFunction: registerValidationBloc.lastNameChanged,
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Last Name",
                          isObscure: false,
                          errorText: snapshot.error,
                        );
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                      stream: registerValidationBloc.email,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          inputType: TextInputType.emailAddress,
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Email",
                          isObscure: false,
                          errorText: snapshot.error,
                          changeFunction: registerValidationBloc.emailChanged,
                        );
                      }
                  ),
                ),

                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                      stream: registerValidationBloc.username,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Username",
                          isObscure: false,
                          errorText: snapshot.error,
                          changeFunction: registerValidationBloc.usernameChanged,
                        );
                      }
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<int>(
                      stream: registerValidationBloc.age,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Age",
                          isObscure: false,
                          errorText: snapshot.error,
                          changeFunction: registerValidationBloc.ageChanged,
                        );
                      }
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child:StreamBuilder<String>(
                      stream: registerValidationBloc.password,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Password",
                          isObscure: true,
                          errorText: snapshot.error,
                          changeFunction: registerValidationBloc.passwordChanged,
                        );
                      }
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                      stream: registerValidationBloc.passwordConfirmation,
                      builder: (context , snapshot) {
                        return CustomAuthInput(
                          textColor: modeBlock.secondaryColor,
                          fillColor: modeBlock.primaryColor,
                          labelText: "Password confirmation",
                          isObscure: true,
                          errorText: snapshot.error,
                          changeFunction: registerValidationBloc.passwordConfirmationChanged,
                        );
                      }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Gender :' ,
                        style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: modeBlock.secondaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ListTile(
                        title:  Text('Male' ,
                          style: TextStyle(
                              fontFamily: 'Rajdhani',
                              color: modeBlock.secondaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title:  Text('Female' , style:
                        TextStyle(
                            fontFamily: 'Rajdhani',
                            color: modeBlock.secondaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<bool>(
                  stream: registerValidationBloc.submitRegisterCheck,
                  builder: (context,snapshot) {
                    return CustomAuthButton(
                      color: modeBlock.buttonColor,
                      buttonContent: "Register Now!",
                      pressFunction: snapshot.hasData ? () => registerUser(registerValidationBloc, _gender) : null
                    );
                  }
                ),
                SizedBox(
                  width: defaultSize * 12,
                  child: Divider(
                    color: modeBlock.secondaryColor,
                    height: defaultSize,
                    indent: defaultSize * 5,
                    endIndent: defaultSize * 5,
                  ),
                ),
                Text('Register with your Social Account' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      color: modeBlock.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                  ),
                ),
                SizedBox(height: defaultSize,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    SignInButtonBuilder(
                      text: 'Sign in with Email',
                      icon: FontAwesomeIcons.facebook,
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Colors.blue[700],
                    ),
                    SignInButtonBuilder(
                      text: 'Sign in with Email',
                      icon: FontAwesomeIcons.google,
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Colors.red[700],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  _showToast(String content , Color backgroundColor , IconData icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ,color: Colors.white),
          SizedBox(
            width: 12.0,
          ),
          Text(content ,
            style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.white
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP_LEFT,
      toastDuration: Duration(seconds: 2),
    );
  }
  void loginUser(RegisterValidationBloc registerBloc) async {
    final result = await registerBloc.loginAfterRegister();
    if(!result.error) {
      Navigator.of(context).pushReplacementNamed('/home');
    }else{
      print('false data');
    }
  }

  void registerUser(RegisterValidationBloc registerBloc , Gender gender) async {

    final ApiResponse<bool> result = await registerBloc.register(gender);
    if(!result.error) {
      _showToast(
          "Added successfully!",
          Colors.green,
          Icons.check,
      );
      loginUser(registerBloc);
    }else{
      _showToast(
          "${result.errorMessage}",
          Colors.red,
          Icons.error,
      );
    }
  }
}
