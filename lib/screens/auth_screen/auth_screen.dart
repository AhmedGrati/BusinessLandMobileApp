
import 'package:businessland_app/models/mode.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'auth_stage.dart';
import 'package:businessland_app/screens/auth_screen/components/login_widget.dart';
import 'package:businessland_app/screens/auth_screen/components/register_widget.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AuthStage stage = AuthStage.Login;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1)
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
    double defaultSize = SizeConfig.defaultSize;
    _controller.forward();
    return Consumer<ModeBlock>(
      builder:(context , modeBlock , children) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                          image: AssetImage("images/logo.webp"),
                        ),
                      ),
                      Text('Welcome To'.toUpperCase(),
                        style:TextStyle(
                          fontFamily: 'TitiliumWeb',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('businessland'.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'TitiliumWeb',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 40
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: FlatButton(
                                onPressed: () {
                                  modeBlock.mode = Mode.dark;
                                },
                                color: Color(0xff1D2333),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Dark',
                                    style: TextStyle(
                                      fontFamily: 'Rajdhani',
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
                                  modeBlock.mode = Mode.light;
                                },
                                color: Color(0xffffffff),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Light',
                                    style: TextStyle(
                                        fontFamily: 'Rajdhani',
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
                        height: defaultSize,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: this.stage == AuthStage.Register ? FlatButton(
                                onPressed: () {
                                  setState(() {
                                    this.stage = AuthStage.Register;
                                  });
                                },
                                color: modeBlock.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: 'Rajdhani',
                                        color: modeBlock.secondaryColor,
                                        fontSize: defaultSize * 2,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ) :
                              OutlineButton(
                                borderSide: BorderSide(
                                    color: modeBlock.primaryColor
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.stage = AuthStage.Register;
                                  });
                                },
                                color: modeBlock.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontFamily: 'Rajdhani',
                                        color: modeBlock.secondaryColor,
                                        fontSize: defaultSize * 2,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              )
                              ,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child : this.stage == AuthStage.Login ? FlatButton(
                                onPressed: () {
                                  setState(() {
                                    this.stage = AuthStage.Login;
                                  });
                                },
                                color: modeBlock.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontFamily: 'Rajdhani',
                                        color: modeBlock.secondaryColor,
                                        fontSize: defaultSize * 2,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ) :
                              OutlineButton(
                                borderSide: BorderSide(
                                    color: modeBlock.primaryColor
                                ),
                                onPressed: () {
                                  setState(() {
                                    this.stage = AuthStage.Login;
                                  });
                                },
                                color: modeBlock.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontFamily: 'Rajdhani',
                                        color: modeBlock.secondaryColor,
                                        fontSize: defaultSize * 2,
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
                          height: defaultSize
                      ),
                      stage == AuthStage.Login
                          ? FadeTransition(
                        opacity: _animation,
                        child: LoginWidget(),
                      ) : RegisterWidget()
                    ],
                  ),
                )
            ),
          ),
        );
      }

    );
  }
}
