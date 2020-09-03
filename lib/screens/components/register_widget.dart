import 'auth_card_widget.dart';
import 'custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
import 'custom_auth_button.dart';
import 'gender_auth_widget.dart';
class RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return  AuthCardWidget(
      height:  defaultSize * 115,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Create your Account!' ,
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
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "Username",
              isObscure: false,
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "Age",
              isObscure: false,
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "Password",
              isObscure: true,
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "Password confirmation",
              isObscure: false,
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "First Name",
              isObscure: false,
            ),
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: CustomAuthInput(
              labelText: "Last Name",
              isObscure: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10.0),
            child: GenderAuthWidget(),
          ),
          CustomAuthButton(
            buttonContent: "Register Now!",
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
          Text('Register with your Social Account' ,
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
                onPressed: () {},
                mini: true,
                backgroundColor: Colors.red[700],
              )
            ],
          )
        ],
      ),
    );
  }
}
