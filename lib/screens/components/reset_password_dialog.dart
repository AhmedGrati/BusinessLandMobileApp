import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_auth_input.dart';

class ResetPasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff1D2333),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Reset password' ,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rajdhani(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              CustomAuthInput(
                labelText: "Email",
                isObscure: false,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Text('Confirm' ,
                            style: GoogleFonts.rajdhani(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15.0,
                          )
                        ],
                      ),
                      color: Colors.green,
                    ),
                    FlatButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Text('Cancel' ,
                            style: GoogleFonts.rajdhani(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: 15.0,
                          )
                        ],
                      ),
                      color: Colors.red,
                    )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
