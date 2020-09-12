import 'package:businessland_app/constants.dart';
import 'package:businessland_app/models/mode.dart';
import 'package:flutter/material.dart';
class ModeBlock extends ChangeNotifier{

  Mode _mode = Mode.dark;
  Color primaryColor = kPrimaryDarkModeColor;
  Color secondaryColor = kSecondaryDarkModeColor;
  Color buttonColor = kButtonDarkModeColor;
  Color cardColor = kCardColorDarkModeColor;
  Color selectedPageColor = kSelectedPageDarkModeColor;
  Mode get mode => _mode;

  set mode(Mode m) {
    changeMode(m);
    notifyListeners();
  }

  void changeMode(Mode m) {
    _mode = m;
    if(m == Mode.light) {
      primaryColor = kPrimaryLightModeColor;
      secondaryColor = kSecondaryLightModeColor;
      buttonColor = kButtonLightModeColor;
      cardColor = kCardColorLightModeColor;
      selectedPageColor = kSelectedPageLightModeColor;
    }else{
      primaryColor = kPrimaryDarkModeColor;
      secondaryColor = kSecondaryDarkModeColor;
      buttonColor = kButtonDarkModeColor;
      cardColor = kCardColorDarkModeColor;
      selectedPageColor = kSelectedPageDarkModeColor;
    }
  }



}