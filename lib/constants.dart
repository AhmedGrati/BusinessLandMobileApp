import 'package:flutter/material.dart';
const kN = 16.0;
const kAuthTextFieldsDecoration = InputDecoration(
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
