import 'package:businessland_app/screens/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> _mockCheckForSession() async{
    await Future.delayed(Duration(milliseconds: 5000) ,() {});
    return true;
  }

  void _navigateAuth() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(
        builder: (context) => AuthScreen())
      );
  }

  @override
  void initState() {
    super.initState();
    _mockCheckForSession().then((value) {
      _navigateAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff1D2333),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              SizedBox(height: defaultSize * 3,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Welcome to'.toUpperCase() ,
                  style: GoogleFonts.titilliumWeb(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: defaultSize * 2.8
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Businessland'.toUpperCase() ,
                  style: GoogleFonts.titilliumWeb(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 5
                  ),
                ),
              ),
              Container(
                height: defaultSize * 10,
                child: Image.asset(
                    "images/loading-splash.gif",
                ),
              )
            ],
          ),
      ),
    );
  }
}
