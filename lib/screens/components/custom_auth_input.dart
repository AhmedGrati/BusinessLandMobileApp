import 'package:businessland_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAuthInput extends StatelessWidget {
  CustomAuthInput({@required this.labelText , this.isObscure});
  final String labelText;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.rajdhani(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.bold
      ),
      keyboardType: TextInputType.emailAddress,
      obscureText: this.isObscure,
      decoration: kAuthTextFieldsDecoration.copyWith(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Color(0xff3F485F)
            ),
            borderRadius: BorderRadius.circular(16.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color :Color(0xff8780F0)
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
          labelText: this.labelText
      ),
    );
  }
}
