import 'package:businessland_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../size_config.dart';
import 'custom_auth_input.dart';

class ResetPasswordDialog extends StatefulWidget {
  @override
  _ResetPasswordDialogState createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  UserService get userService => GetIt.I<UserService>();
  String _email;
  FToast fToast;
  bool isLoading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }
  @override
  Widget build(BuildContext context) {
    fToast = FToast(context);
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    double defaultSize = SizeConfig.defaultSize;

    return Dialog(
      backgroundColor: Color(0xff1D2333),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
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
                            sendEmail();
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
      ),
    );
  }

  _showToast(String content , Color backgroundColor , IconData icon , int second) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ,color: Colors.white),
          SizedBox(
            width: 12.0,
          ),
          Text(content ,
            style: GoogleFonts.rajdhani(
                color: Colors.white
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP_LEFT,
      toastDuration: Duration(seconds: second),
    );
  }


  void sendEmail() async {
    setState(() {
      isLoading = true;
    });
    isLoading ? showDialog(context: context ,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: Color(0xff1D2333),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: SizeConfig.defaultSize*12,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Processing ...' ,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Image.asset("images/loading.gif" ,
                      width: SizeConfig.defaultSize * 3,
                      height: SizeConfig.defaultSize * 3,
                    )
                  ],
                ),
              ),
            ),
          );
    }) : Text('');
    final result = await this.userService.sendResetPasswordEmail(_email);
    Navigator.pop(context);
    if(!result.error) {
      _showToast(
          "Email sent successfully!",
          Colors.green,
          Icons.check,
          3
      );
      Navigator.pop(context);
    }else{
      _showToast(
          "${result.errorMessage}",
          Colors.red,
          Icons.error,
        2
      );
    }
  }
}
