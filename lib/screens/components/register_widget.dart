import 'auth_card_widget.dart';
import 'custom_auth_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../size_config.dart';
import 'custom_auth_button.dart';
import '../../models/gender.dart';
import '../../models/user.dart';
class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  Gender _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    double defaultSize = SizeConfig.defaultSize;
    String _email;
    String _password;
    String _firstName;
    String _lastName;
    int _age;
    String _passwordConfirmation;
    String _username;


    return  AuthCardWidget(
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
                style: GoogleFonts.rajdhani(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: CustomAuthInput(
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
                    style: GoogleFonts.rajdhani(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  ListTile(
                    title:  Text('Male' ,
                      style: GoogleFonts.rajdhani(
                          color: Colors.white,
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
                    GoogleFonts.rajdhani(
                        color: Colors.white,
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

                },
            ),
            SizedBox(
              width: defaultSize * 12,
              child: Divider(
                color: Colors.white60,
                height: defaultSize,
                indent: defaultSize * 5,
                endIndent: defaultSize * 5,
              ),
            ),
            Text('Register with your Social Account' ,
              textAlign: TextAlign.center,
              style: GoogleFonts.rajdhani(
                  color: Colors.white,
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
}
