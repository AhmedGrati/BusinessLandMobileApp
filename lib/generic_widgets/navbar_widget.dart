import 'package:businessland_app/generic_widgets/search_input_widget.dart';
import 'package:businessland_app/screens/auth_screen/components/custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:businessland_app/size_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xff615dfa),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BusinessLand'.toUpperCase() ,
            style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 16.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Image.asset("images/logo.webp" ,
            height: 30.0,
            width: 30.0,
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.search , color: Colors.white,),
        )
      ],
    );
  }
}
