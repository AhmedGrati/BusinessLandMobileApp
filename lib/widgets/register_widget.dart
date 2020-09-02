import 'package:businessland_app/size_config.dart';
import 'package:businessland_app/widgets/custom_auth_button.dart';
import 'package:businessland_app/widgets/custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return  Container(
        height:  defaultSize * 60,
        decoration: BoxDecoration(
          color: Color(0xFF1D2333),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
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
                child: CustomAuthInput(),
            ),
            Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: CustomAuthInput(),
              ),
            Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Forgot Password ?' ,
                  style: GoogleFonts.rajdhani(
                    color: Color(0xffADAFCA),
                    fontWeight: FontWeight.w900,
                    fontSize: 15.0
                  ),
                ),
              ),
            CustomAuthButton(),
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
