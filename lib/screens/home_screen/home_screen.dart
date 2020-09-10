import 'package:businessland_app/generic_widgets/drawer_widget.dart';
import 'package:businessland_app/generic_widgets/navbar_widget.dart';
import 'package:businessland_app/screens/home_screen/pages/game_page.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModeBlock>(
      builder: (context , modeBlock , child) {
        return Scaffold(
          backgroundColor: modeBlock.primaryColor,
            drawer: SafeArea(child: DrawerWidget()),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xff615dfa),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.videogame_asset , color: Colors.white,),
                  title: Text('Games' ,
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color(0xff615dfa),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat , color: Colors.white,),
                  title: Text('Chat' ,
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color(0xff615dfa),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active , color: Colors.white,),
                  title: Text('Notifications' ,
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color(0xff615dfa),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings , color: Colors.white,),
                  title: Text('Settings' ,
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color(0xff615dfa),
                ),
              ],
            ),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xff615dfa),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BusinessLand'.toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Image.asset("images/logo.webp",
                    height: 30.0,
                    width: 30.0,
                  ),
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white,),
                )
              ],
            ),
            body: GamePage(
              cardColor: modeBlock.cardColor,
              primaryColor: modeBlock.primaryColor,
              secondaryColor: modeBlock.secondaryColor,
            )
        );
      }

    );
  }
}

