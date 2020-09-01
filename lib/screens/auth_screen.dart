import 'package:businessland_app/widgets/register_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orientation screenOrientation = MediaQuery.of(context).orientation;
    double screenHeight;
    double screenWidth;
    if(screenOrientation == Orientation.portrait) {
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;
    }else{
      screenHeight = MediaQuery.of(context).size.width;
      screenWidth = MediaQuery.of(context).size.height;
    }
    print(screenHeight);
    print(screenWidth);
    return SingleChildScrollView(
      child: Container(
        height:screenHeight * 1.25,
        padding: EdgeInsets.all(screenWidth * 0.1),
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/auth_cover.webp"),
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft
          )
        ),
        child: Column(
          children: <Widget>[
            Text('Welcome To'.toUpperCase() ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth*0.075,
                  fontWeight: FontWeight.w300
                ),
            ),
            Text('vikinger'.toUpperCase() ,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: screenWidth*0.15
                ),
            ),
            Container(
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: screenWidth*0.4,
                      child: FlatButton(
                            onPressed: () {},
                            color: Color(0xff1D2333),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                          ),
                        ),
                    ),
                    Container(
                      width: screenWidth*0.4,
                      child: FlatButton(
                            onPressed: () {},
                            color: Color(0xffffffff),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Login',
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
            ),
            SizedBox(
              height: screenWidth*0.05,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: screenWidth*0.4,
                    child: FlatButton(
                          onPressed: () {},
                          color: Color(0xff1D2333),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Dark',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                        ),
                    ),
                  ),
                  Container(
                    width: screenWidth*0.4,
                    child: FlatButton(
                          onPressed: () {},
                          color: Color(0xffffffff),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Light',
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: screenWidth*0.05,
            ),
            RegisterWidget(),
          ],
        ),
      ),
    );
  }
}
