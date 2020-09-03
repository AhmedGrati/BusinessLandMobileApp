import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gender.dart';
class GenderAuthWidget extends StatefulWidget {
  @override
  _GenderAuthWidgetState createState() => _GenderAuthWidgetState();
}

class _GenderAuthWidgetState extends State<GenderAuthWidget> {
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Gender :' ,
          style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          ),
        ),
        ListTile(
          title:  Text('Male' ,
            style: GoogleFonts.rajdhani(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),
          ),
          leading: Radio(
            activeColor: Colors.green,
            value: Gender.male,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
        ListTile(
          title:  Text('Female' , style:
            GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
            ),
          ),
          leading: Radio(
            activeColor: Colors.green,
            value: Gender.female,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
