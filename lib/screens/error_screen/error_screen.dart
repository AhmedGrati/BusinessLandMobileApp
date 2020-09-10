import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff615dfa),
      ),
      body: Center(
        child: Text('ERROR 404!' ,
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold,
            color: Colors.red[600]
          ),
        ),
      ),
    );
  }
}
