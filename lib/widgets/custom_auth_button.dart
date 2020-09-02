import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      decoration: BoxDecoration(
          color: Color(0xff7750F8),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Login to your Account!',
          textAlign: TextAlign.center,
          style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0
          ),
        ),
      ),
    );
  }
}
