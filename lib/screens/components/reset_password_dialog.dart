import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
import 'custom_auth_input.dart';

class ResetPasswordDialog extends StatefulWidget {
  @override
  _ResetPasswordDialogState createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    double defaultSize = SizeConfig.defaultSize;
    String _email;
    return Dialog(
      backgroundColor: Color(0xff1D2333),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Form(
        key: _key,
        child: Container(
          height: defaultSize*38,
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
                  inputType: TextInputType.emailAddress,
                  validator: (String value) {
                    if(value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Please enter a valid email Address';
                    }
                    return null;
                  },
                  saveFunction: (String value) {
                    _email = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        onPressed: (){
                          if(!_key.currentState.validate()) {
                          print('not validated');
                          return;
                          }
                          _key.currentState.save();
                        },
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
                        onPressed: (){
                          Navigator.pop(context);
                        },
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
      ),
    );
  }
}
