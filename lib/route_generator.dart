import 'package:businessland_app/screens/auth_screen/auth_screen.dart';
import 'package:businessland_app/screens/error_screen/error_screen.dart';
import 'package:businessland_app/screens/home_screen/home_screen.dart';
import 'package:businessland_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder:(_) => SplashScreen());
      case '/auth':
        return MaterialPageRoute(builder:(_) => AuthScreen());
      case '/home':
        return MaterialPageRoute(builder:(_) => HomeScreen());
      default:
        return MaterialPageRoute(builder:(_) => ErrorScreen());
    }
  }
}