import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/screens/auth_screen/components/reset_password_dialog.dart';
import 'package:businessland_app/screens/home_screen/home_screen.dart';
import 'package:businessland_app/screens/toast_widget.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:businessland_app/size_config.dart';
import 'auth_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_auth_button.dart';
import 'custom_auth_input.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get_it/get_it.dart';
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
            style: GoogleFonts.rajdhani(
              color: Colors.white
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }


  @override
  Widget build(BuildContext context) {
    fToast = FToast(context);
    double defaultSize = SizeConfig.defaultSize;
    return  AuthCardWidget(
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
                style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: CustomAuthInput(
                labelText: "Email",
                isObscure: false,
                inputType: TextInputType.emailAddress,
                validator: (String value) {
                  if(value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                      .hasMatch(value)) {
                    return 'Please enter a valid email Address';
                  }
                  return null;
                },
                saveFunction: (String value) {
                  _email = value;
                },
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: CustomAuthInput(
                labelText: "Password",
                isObscure: true,
                inputType: TextInputType.text,
                validator: (String value) {
                  if(value.isEmpty) {
                    return 'Password is required';
                  }
                  if(value.length < 5) {
                    return 'Password should have at least 5 characters';
                  }
                  return null;
                },
                saveFunction: (String value) {
                  _password = value;
                },
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
                  style: GoogleFonts.rajdhani(
                      color: Color(0xffADAFCA),
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0
                  ),
                ),
              ),
            ),
            CustomAuthButton(
              buttonContent: "Login to your Account!",
              pressFunction:() async {
                if(!_key.currentState.validate()) {
                print('not validated');
                return;
                }
                _key.currentState.save();
                final result = await this.userService.login(LoginModel(
                  email: _email,
                  password: _password
                ));
                if(!result.error) {
                  _showToast(
                      "Login Attempted Successfully",
                      Colors.green,
                      Icons.check
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen())
                  );
                }else{
                  print('false data');
                  _showToast(
                    "${result.errorMessage}",
                    Colors.red,
                    Icons.error
                  );
                }
              },
            ),
            SizedBox(
              width: defaultSize * 12,
              child: Divider(
                color: Colors.white60,
                height: defaultSize,
                indent: defaultSize * 5,
                endIndent: defaultSize * 5,
              ),
            ),
            Text('Login with your Social Account' ,
              textAlign: TextAlign.center,
              style: GoogleFonts.rajdhani(
                  color: Colors.white,
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
}
