import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Color kPrimaryLightModeColor = Colors.white;
Color kSecondaryLightModeColor = Color(0xff1D2333);
Color kButtonLightModeColor = Color(0xff615dfa);

Color kPrimaryDarkModeColor = Color(0xff1D2333);
Color kSecondaryDarkModeColor = Colors.white;
Color kButtonDarkModeColor = Color(0xff7750F8);

const kAuthTextFieldsDecoration = InputDecoration(
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.red
      ),
  ),
  errorStyle: TextStyle(
    color: Colors.red,
    fontSize: 10.0,
    fontWeight: FontWeight.bold
  ),
  labelText: 'Password',
  labelStyle: TextStyle(
      color:Color(0xffADAFCA)
  ),
  filled: true,
  fillColor: Color(0xff1D2333),

  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color :Color(0xff8780F0)
      ),

  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color:Color(0xff3F485F)
      ),
  ),
);
