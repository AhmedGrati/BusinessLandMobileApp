import 'package:businessland_app/screens/auth_screen/components/custom_auth_button.dart';
import 'package:businessland_app/state_management_blocks/active_page_provider.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:businessland_app/models/mode.dart';
import 'package:businessland_app/size_config.dart';
class DrawerWidget extends StatelessWidget {
  final List<String> pagesName = ['Games', 'Chat', 'Notifications', 'Settings'];
  final List<IconData> pagesIcon = [
    Icons.videogame_asset,
    Icons.chat,
    Icons.notifications_active,
    Icons.settings
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
                              if (modeBlock.mode == Mode.dark) {
                                modeBlock.mode = Mode.light;
                              } else {
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
                          Navigator.pop(context);
                          pageController.animateToPage(
                              index,
                              duration: Duration(microseconds: 2500),
                              curve: Curves.ease
                          );
                          activePageProvider.pageIndex = index;
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(),
                    itemCount: 4),
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
