import 'package:businessland_app/models/api_response.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:businessland_app/screens/auth_screen/components/reset_password_dialog.dart';
import 'package:businessland_app/screens/home_screen/home_screen.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:businessland_app/size_config.dart';
import 'package:businessland_app/state_management_blocks/blocs/login_bloc/login_validation_bloc.dart';
import 'auth_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_auth_button.dart';
import 'custom_auth_input.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  UserService get userService => GetIt.I<UserService>();
  FToast fToast;
  String _email;
  String _password;
  GlobalKey<FormState> _key = GlobalKey<FormState>();

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


  @override
  Widget build(BuildContext context) {
    fToast = FToast(context);
    double defaultSize = SizeConfig.defaultSize;

    final loginBloc = LoginValidationBloc();
    return  Consumer<ModeBlock>(
    builder: (context , modeBlock , children) {
        return AuthCardWidget(
          color: modeBlock.primaryColor,
          height: defaultSize*60,
          content: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Account Login' ,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                    stream: loginBloc.email,
                    builder: (context , snapshot) {
                      return CustomAuthInput(
                        errorText: snapshot.error,
                        changeFunction: loginBloc.emailChanged,
                        textColor: modeBlock.secondaryColor,
                        fillColor: modeBlock.primaryColor,
                        labelText: "Email",
                        isObscure: false,
                        inputType: TextInputType.emailAddress,
                      );
                    }
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: StreamBuilder<String>(
                    stream: loginBloc.password,
                    builder: (context , snapshot) {
                      return  CustomAuthInput(
                        errorText: snapshot.error,
                        changeFunction: loginBloc.passwordChanged,
                        textColor: modeBlock.secondaryColor,
                        fillColor: modeBlock.primaryColor,
                        labelText: "Password",
                        isObscure: true,
                        inputType: TextInputType.text,
                      );
                    }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(context: context ,
                          builder: (context) {
                            return ResetPasswordDialog();
                          }
                      );
                    },
                    child: Text(
                      'Forgot Password ?' ,
                      style: TextStyle(
                          fontFamily: 'Rajdhani',
                          color: Color(0xffADAFCA),
                          fontWeight: FontWeight.w900,
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ),
                StreamBuilder<bool>(
                  stream: loginBloc.submitLoginCheck,
                  builder: (context , snapshot) {
                    return CustomAuthButton(
                      color: modeBlock.buttonColor,
                      buttonContent: "Login to your Account!",
                      pressFunction: snapshot?.hasData ? () => loginUser(loginBloc) :null
                    );
                 },
                ),
                SizedBox(
                  width: defaultSize * 12,
                  child: Divider(
                    color : modeBlock.secondaryColor,
                    height: defaultSize,
                    indent: defaultSize * 5,
                    endIndent: defaultSize * 5,
                  ),
                ),
                Text('Login with your Social Account' ,
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
                      onPressed: (){},
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

  void loginUser(LoginValidationBloc loginBloc) async {
    ApiResponse<User> result = await loginBloc.login();
    if(!result.error) {
      _showToast(
          "Login Attempted Successfully",
          Colors.green,
          Icons.check
      );
      Navigator.of(context).pushNamed('/home');
    }else{
      _showToast(
          "${result.errorMessage}",
          Colors.red,
          Icons.error
      );
    }
  }
}
