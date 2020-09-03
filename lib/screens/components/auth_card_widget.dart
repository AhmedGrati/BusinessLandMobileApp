import 'package:flutter/material.dart';

class AuthCardWidget extends StatelessWidget {
  final Widget content;
  final double height;
  AuthCardWidget({this.content, this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  this.height,
      decoration: BoxDecoration(
          color: Color(0xFF1D2333),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          content
        ],
      ),
    );
  }
}
