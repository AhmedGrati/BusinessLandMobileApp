import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CustomAuthButton extends StatelessWidget {
  final String buttonContent;
  final Function pressFunction;
  final Color color;
  CustomAuthButton({@required this.buttonContent , this.pressFunction , this.color });
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FlatButton(
          disabledColor: Colors.grey,
          onPressed: pressFunction,
            child: Text(
              buttonContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            ),

        ),
      ),
    );
  }
}
