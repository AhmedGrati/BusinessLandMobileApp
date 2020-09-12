import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Chat Page' ,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Rajdhani',
            fontSize: 20.0,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
