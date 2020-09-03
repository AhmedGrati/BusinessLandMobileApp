import 'package:businessland_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAuthInput extends StatelessWidget {
  CustomAuthInput({@required this.labelText , this.isObscure , this.inputType , this.validator , this.saveFunction});
  final String labelText;
  final bool isObscure;
  final TextInputType inputType;
  final Function validator;
  final Function saveFunction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.rajdhani(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.bold
      ),
      keyboardType: inputType,
      obscureText: this.isObscure,
      decoration: kAuthTextFieldsDecoration.copyWith(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
              borderRadius: BorderRadius.circular(16.0)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red
            ),
              borderRadius: BorderRadius.circular(16.0)
          ),
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
      validator: this.validator,
      onSaved: this.saveFunction,

    );
  }
}
