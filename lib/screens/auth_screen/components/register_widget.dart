import 'package:businessland_app/models/gender.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:businessland_app/screens/home_screen/home_screen.dart';
import 'package:businessland_app/services/user_service.dart';
import 'package:businessland_app/state_management_blocks/mode_block.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'auth_card_widget.dart';
import 'custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_auth_button.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  FToast fToast;
  Gender _gender = Gender.male;
  UserService get userService => GetIt.I<UserService>();

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  double defaultSize = SizeConfig.defaultSize;
  String _email;
  String _password;
  String _firstName;
  String _lastName;
  int _age;
  String _passwordConfirmation;
  String _username;
  @override
  Widget build(BuildContext context) {
    fToast = FToast(context);
    return  Consumer<ModeBlock>(
      builder: (context , modeBlock , children) {
        return AuthCardWidget(
          color: modeBlock.primaryColor,
          height:  defaultSize * 144,
          content: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Create your Account!' ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        color: modeBlock.secondaryColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "First Name",
                    isObscure: false,
                    inputType: TextInputType.text,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'First Name is required';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _firstName = value;
                    },
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Last Name",
                    isObscure: false,
                    inputType: TextInputType.text,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Last Name is required';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _lastName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Email",
                    isObscure: false,
                    inputType: TextInputType.emailAddress,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                        return 'Please enter a valid email Address';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _email = value;
                    },
                  ),
                ),

                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Username",
                    isObscure: false,
                    inputType: TextInputType.text,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _username = value;
                    },
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Age",
                    isObscure: false,
                    inputType: TextInputType.number,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Age is required';
                      }
                      if(int.parse(value) < 12 && int.parse(value) > 80) {
                        return 'Age should be between 12 and 80';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _age = int.parse(value);
                    },
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Password",
                    isObscure: true,
                    inputType: TextInputType.text,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Password is required';
                      }
                      if(value.length < 5) {
                        return 'Password should have at least 5 characters';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _password = value;
                    },
                    changeFunction: (String value) {
                      _password = value;
                    },
                  ),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                  child: CustomAuthInput(
                    textColor: modeBlock.secondaryColor,
                    fillColor: modeBlock.primaryColor,
                    labelText: "Password confirmation",
                    isObscure: true,
                    inputType: TextInputType.text,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Password confirmation is required';
                      }
                      if(value != _password) {
                        print(value);
                        print(_password);
                        return 'Password confirmation should match';
                      }
                      return null;
                    },
                    saveFunction: (String value) {
                      _passwordConfirmation = value;
                    },
                    changeFunction: (String value) {
                      _passwordConfirmation = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0 , vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Gender :' ,
                        style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      ListTile(
                        title:  Text('Male' ,
                          style: TextStyle(
                              fontFamily: 'Rajdhani',
                              color: modeBlock.secondaryColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title:  Text('Female' , style:
                        TextStyle(
                            fontFamily: 'Rajdhani',
                            color: modeBlock.secondaryColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        leading: Radio(
                          activeColor: Colors.green,
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                CustomAuthButton(
                  color: modeBlock.buttonColor,
                  buttonContent: "Register Now!",
                  pressFunction: (){
                    if(!_key.currentState.validate()) {
                      print('not validated');
                      return;
                    }
                    _key.currentState.save();

                    User user = User(
                      gender: _gender,
                      username: _username,
                      email: _email,
                      age: _age,
                      password: _password,
                      firstName: _firstName,
                      lastName: _lastName,
                    );
                    print(user.username);
                    this.registerUser(user);
                  },
                ),
                SizedBox(
                  width: defaultSize * 12,
                  child: Divider(
                    color: modeBlock.secondaryColor,
                    height: defaultSize,
                    indent: defaultSize * 5,
                    endIndent: defaultSize * 5,
                  ),
                ),
                Text('Register with your Social Account' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Rajdhani',
                      color: modeBlock.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0
                  ),
                ),
                SizedBox(height: defaultSize,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    SignInButtonBuilder(
                      text: 'Sign in with Email',
                      icon: FontAwesomeIcons.facebook,
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Colors.blue[700],
                    ),
                    SignInButtonBuilder(
                      text: 'Sign in with Email',
                      icon: FontAwesomeIcons.google,
                      onPressed: () {},
                      mini: true,
                      backgroundColor: Colors.red[700],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  _showToast(String content , Color backgroundColor , IconData icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ,color: Colors.white),
          SizedBox(
            width: 12.0,
          ),
          Text(content ,
            style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.white
            ),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP_LEFT,
      toastDuration: Duration(seconds: 2),
    );
  }
  void loginUser() async {
    final result = await this.userService.login(LoginModel(
        email: _email,
        password: _password
    ));
    if(!result.error) {
      Navigator.of(context).pushNamed('/home');
    }else{
      print('false data');
    }
  }

  void registerUser(User user) async {
    final result = await this.userService.registerUser(user);
    if(!result.error) {
      _showToast(
          "Added successfully!",
          Colors.green,
          Icons.check,
      );
      loginUser();
    }else{
      _showToast(
          "${result.errorMessage}",
          Colors.red,
          Icons.error,
      );
    }
  }
}
