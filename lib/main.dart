import 'package:businessland_app/models/mode.dart';
import 'package:businessland_app/screens/auth_screen/auth_screen.dart';
import 'package:businessland_app/screens/splash_screen/splash_screen.dart';
import 'package:businessland_app/services_set_up.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

  ServiceSetUp serviceSetUp = ServiceSetUp();
  runApp(
//    DevicePreview(
//      enabled: !kReleaseMode,
//      builder: (context) => BusinessLandApp(),
//    )
  BusinessLandApp()
  );
}

class BusinessLandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModeBlock>(
          create: (_) => ModeBlock(),
        )
      ],
      child: MaterialApp(
//      locale: DevicePreview.of(context).locale,
//      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: SplashScreen()
          ),
        ),
      ),
    );
  }
}


