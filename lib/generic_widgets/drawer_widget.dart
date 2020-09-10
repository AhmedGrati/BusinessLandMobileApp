import 'package:businessland_app/screens/auth_screen/components/custom_auth_button.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:businessland_app/models/mode.dart';


class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer<ModeBlock>(
      builder: (context , modeBlock , child) {
         return Drawer(
            child: Container(
              color: modeBlock.primaryColor,
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage("images/male.webp"),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ahmed Grati',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Rajdhani",
                                        fontSize: 16.0,
                                        color: modeBlock.secondaryColor),
                                  ),
                                  Text(
                                    'Welcome Back!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Rajdhani",
                                        fontSize: 16.0,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              CustomSwitch(
                                value: modeBlock.mode == Mode.light,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                    if(modeBlock.mode == Mode.dark) {
                                      modeBlock.mode = Mode.light;
                                    }else{
                                      modeBlock.mode = Mode.dark;
                                    }
                                },
                              ),
                            ],
                          ),
                          CustomAuthButton(
                            pressFunction: () {},
                            buttonContent: "Logout",
                            color: Color(0xff615dfa),
                          ),
                        ],
                      ),
                    ),
                  Container(
                    height: 200.0,
                      child: Column(
                        children: [
                          CustomListTile(
                            tileTitleColor: modeBlock.secondaryColor,
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          );
      }
    );
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({this.tileTitleColor});
  final Color tileTitleColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.videogame_asset , color: Colors.blueGrey,),
      title: Text(
        "Games",
        style: TextStyle(
          fontFamily: 'Rajdhani',
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: this.tileTitleColor
        ),
      ),
    );
  }
}
