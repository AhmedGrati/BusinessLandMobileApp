import 'package:businessland_app/state_management_blocks/active_page_provider.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:businessland_app/models/mode.dart';
import 'package:businessland_app/size_config.dart';
class DrawerWidget extends StatelessWidget {
  final List<String> pagesName = ['Games',
    'Chat',
    'Notifications',
    'Settings' ,
    'Logout'
  ];
  final List<IconData> pagesIcon = [
    Icons.videogame_asset,
    Icons.chat,
    Icons.notifications_active,
    Icons.settings,
    Icons.exit_to_app
  ];

  final PageController pageController;

  DrawerWidget({this.pageController});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = SizeConfig.orientation;
    print(orientation);
    return Consumer2<ModeBlock, ActivePageProvider>(
        builder: (context, modeBlock, activePageProvider, child) {
      return Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: modeBlock.primaryColor,
          child: Column(
            children: [
              Container(
                height: 170,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:12.0),
                        child: FlutterSwitch(
                          activeText: 'Dark',
                          inactiveText: 'Light',
                          activeTextColor: Colors.white,
                          inactiveTextColor: Colors.white,
                          inactiveColor: Color(0xff615dfa),
                          showOnOff: true,
                          value: modeBlock.mode == Mode.dark,
                          width: 100,
                          onToggle: (bool value) {
                            if (modeBlock.mode == Mode.dark) {
                              modeBlock.mode = Mode.light;
                            } else {
                              modeBlock.mode = Mode.dark;
                            }
                          }
                        ),
//                        child: LiteRollingSwitch(
//                          //initial value
//                          value: modeBlock.mode == Mode.light,
//                          textOn: 'Dark',
//                          textOff: 'Light',
//                          colorOn: Color(0xff615dfa),
//                          colorOff: Color(0xff615dfa),
//                          iconOn: FontAwesomeIcons.moon,
//                          iconOff: FontAwesomeIcons.sun,
//                          textSize: 16.0,
//                          onChanged: (bool state) {
//                            if (modeBlock.mode == Mode.dark) {
//                              modeBlock.mode = Mode.light;
//                            } else {
//                              modeBlock.mode = Mode.dark;
//                            }
//                            print('Current State of SWITCH IS: $state');
//                          },
//                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 210,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomListTile(
                        tileTitleColor: modeBlock.secondaryColor,
                        backgroundColor: modeBlock.selectedPageColor,
                        icon: this.pagesIcon[index],
                        name: this.pagesName[index],
                        pageIndex: index,
                        activePageIndex: activePageProvider.pageIndex,
                        onTapFunction: () {

                          // if it's not logout
                          if(index != this.pagesName.length-1) {
                            Navigator.pop(context);
                            pageController.animateToPage(
                                index,
                                duration: Duration(microseconds: 2500),
                                curve: Curves.ease
                            );
                            activePageProvider.pageIndex = index;
                          }else{// logout
                            Navigator.pushReplacementNamed(context,'/auth');
                          }
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(),
                    itemCount: 5),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {this.tileTitleColor,
      this.backgroundColor,
      this.name,
      this.icon,
      this.pageIndex,
      this.onTapFunction,
      this.activePageIndex});

  final Color tileTitleColor, backgroundColor;
  final String name;
  final IconData icon;
  final int pageIndex;
  final int activePageIndex;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap:onTapFunction,
        splashColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
              color: pageIndex == activePageIndex ? backgroundColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20.0)),
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(
                  this.icon,
                  color: pageIndex == activePageIndex
                      ? Colors.white
                      : Colors.blueGrey,
                ),
                title: Text(
                  this.name,
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: pageIndex == activePageIndex
                          ? Colors.white
                          : this.tileTitleColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
