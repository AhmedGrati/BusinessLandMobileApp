import 'package:flutter/material.dart';

class AuthCardWidget extends StatelessWidget {
  final Widget content;
  final double height;
  final Color color;
  AuthCardWidget({this.content, this.height , this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  this.height,
      decoration: BoxDecoration(
          color: this.color,
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
