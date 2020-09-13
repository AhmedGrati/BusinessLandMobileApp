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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: FlatButton(
              color: Color(0xff615dfa),
              disabledColor: Colors.grey[100],
              textColor: Colors.white,
              disabledTextColor: Colors.grey[700],
              onPressed: pressFunction,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    buttonContent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                    ),
                  ),
                ),

            ),
          )
    );
  }
}
