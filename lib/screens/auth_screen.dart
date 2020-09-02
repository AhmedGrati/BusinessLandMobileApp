import 'package:businessland_app/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    print(defaultSize);
    return SingleChildScrollView(
      child:Container(
        height:defaultSize * 105,
        padding: EdgeInsets.all(
            16
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/auth_cover.webp"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter
            )
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage("images/logo.png"),
              ),
            ),
            Text('Welcome To'.toUpperCase() ,
              style: GoogleFonts.titilliumWeb(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
              ),
            ),
            Text('vikinger'.toUpperCase() ,
              style: GoogleFonts.titilliumWeb(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 50
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: FlatButton(
                        onPressed: () {},
                        color: Color(0xff1D2333),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Register',
                            style: GoogleFonts.rajdhani(
                                color: Colors.white,
                              fontSize: defaultSize*2,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container( 
                      child: FlatButton(
                        onPressed: () {},
                        color: Color(0xffffffff),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Login',
                            style: GoogleFonts.rajdhani(
                                fontSize: defaultSize*2,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: defaultSize,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: FlatButton(
                      onPressed: () {},
                      color: Color(0xff1D2333),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Dark',
                          style: GoogleFonts.rajdhani(
                              color: Colors.white,
                            fontSize: defaultSize*2,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container( 
                    child: FlatButton(
                      onPressed: () {},
                      color: Color(0xffffffff),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Light',
                          style: GoogleFonts.rajdhani(
                            fontWeight: FontWeight.bold,
                            fontSize: defaultSize*2
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height : defaultSize
            ),
            RegisterWidget(),
          ],
        ),
      )
    );
  }
}
