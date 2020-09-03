import 'package:businessland_app/screens/components/reset_password_dialog.dart';
import 'package:businessland_app/size_config.dart';
import 'auth_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_auth_button.dart';
import 'custom_auth_input.dart';
import 'custom_auth_input.dart';
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  String _email;
  String _password;
  GlobalKey<FormState> _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                },
                saveFunction: (String value) {
                  _password = value;
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
                    print("empty");
                    return 'Password is required';
                  }
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
              pressFunction:() {
                if(!_key.currentState.validate()) {
                print('not validated');
                return;
                }
                _key.currentState.save();
                print("email : $_email");
                print("password : $_password");
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
