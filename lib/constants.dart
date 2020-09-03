import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
const kN = 16.0;
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
