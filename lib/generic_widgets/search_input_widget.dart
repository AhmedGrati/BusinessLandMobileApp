import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontFamily: 'Rajdhani',
          fontSize: 12.0,
          color: Colors.white
      ),
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Color(0xff5535f8),
          hintText: 'Search here for people and groups ...',
          hintStyle: TextStyle(
            fontFamily: 'Rajdhani',
            fontSize: 12.0,
            color: Color(0xff7568E2)
          ),
          contentPadding:
          EdgeInsets.only(left: 15, top: 17),
        suffixIcon: Icon(
          Icons.search,
              color: Color(0xff7568E2),
        )
      ),
    );
  }
}
