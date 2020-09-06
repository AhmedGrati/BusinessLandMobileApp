import 'package:businessland_app/constants.dart';
import 'package:businessland_app/models/mode.dart';
import 'package:flutter/material.dart';
class ModeBlock extends ChangeNotifier{

  Mode _mode = Mode.light;
  Color primaryColor = kPrimaryLightModeColor;
  Color secondaryColor = kSecondaryLightModeColor;
  Color buttonColor = kButtonLightModeColor;
  Mode get mode => _mode;

  set mode(Mode m) {
    changeMode(m);
    notifyListeners();
  }

  void changeMode(Mode m) {
    if(m == Mode.light) {
      primaryColor = kPrimaryLightModeColor;
      secondaryColor = kSecondaryLightModeColor;
      buttonColor = kButtonLightModeColor;
    }else{
      primaryColor = kPrimaryDarkModeColor;
      secondaryColor = kSecondaryDarkModeColor;
      buttonColor = kButtonDarkModeColor;
    }
  }



}