import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAuthButton extends StatelessWidget {
  final String buttonContent;
  final Function pressFunction;
  CustomAuthButton({@required this.buttonContent , this.pressFunction });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      decoration: BoxDecoration(
          color: Color(0xff7750F8),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FlatButton(
          disabledColor: Colors.grey,
          onPressed: pressFunction,
            child: Text(
              buttonContent,
              textAlign: TextAlign.center,
              style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            ),

        ),
      ),
    );
  }
}
