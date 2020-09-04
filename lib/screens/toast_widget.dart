//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//
//class ToastWidget extends StatefulWidget {
//
//  @override
//  _ToastWidgetState createState() => _ToastWidgetState();
//}
//
//class _ToastWidgetState extends State<ToastWidget> {
//  FToast fToast;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    fToast = FToast(context);
//  }
//
//  _showToast() {
//    Widget toast = Container(
//      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(25.0),
//        color: Colors.greenAccent,
//      ),
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: [
//          Icon(Icons.check),
//          SizedBox(
//            width: 12.0,
//          ),
//          Text("This is a Custom Toast"),
//        ],
//      ),
//    );
//
//
//     fToast.showToast(
//      child: toast,
//      gravity: ToastGravity.BOTTOM,
//      toastDuration: Duration(seconds: 2),
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    return _showToast()
//  }
//}
