import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF1D2333),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Account Login' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Username or Email',
                    labelStyle: TextStyle(
                       color:Color(0xffADAFCA)
                    ),
                    filled: true,
                    fillColor: Color(0xff1D2333),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xff8780F0)
                      ),
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:Color(0xff3F485F)
                      ),
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                  ),
                ),
            ),
            Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color:Color(0xffADAFCA)
                    ),
                    filled: true,
                    fillColor: Color(0xff1D2333),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color :Color(0xff8780F0)
                        ),
                        borderRadius: BorderRadius.circular(16.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:Color(0xff3F485F)
                        ),
                        borderRadius: BorderRadius.circular(16.0)
                    ),
                  ),
                ),
              ),
             Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Forgot Password ?' ,
                  style: TextStyle(
                    color: Color(0xffADAFCA),
                    fontWeight: FontWeight.w900,
                    fontSize: 15.0
                  ),
                ),
              ),
             Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xff7750F8),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Login to your Account!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    ),
                  ),
                ),
            ),
            SizedBox(
              height: 20.0,
            ),
             Text('Login with your Social Account' ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0
                ),
              ),
          ],
        ),
    );
  }
}
