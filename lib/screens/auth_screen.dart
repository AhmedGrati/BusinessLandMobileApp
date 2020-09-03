
import 'package:businessland_app/screens/auth_stage.dart';
import 'package:businessland_app/screens/components/card_fade_in_animation.dart';
import 'package:businessland_app/screens/components/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config.dart';
import 'components/register_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  AuthStage stage = AuthStage.Login;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    print(_controller);
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // initiliazing the size config
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    _controller.forward();
    return SingleChildScrollView(
      child:Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
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
            Text('businessland'.toUpperCase() ,
              style: GoogleFonts.titilliumWeb(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 40
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            this.stage = AuthStage.Register;
                          });
                        },
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
                        onPressed: () {
                          setState(() {
                            this.stage = AuthStage.Login;
                          });
                        },
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
            stage == AuthStage.Login
                ? FadeTransition(
              opacity: _animation,
              child: LoginWidget(),
            ) :
                  (stage == AuthStage.Register
                      ? FadeTransition(
                    opacity: _animation,
                    child: RegisterWidget(),
                  ) : null)// todo add Forgot password widget
          ],
        ),
      )
    );
  }
}
