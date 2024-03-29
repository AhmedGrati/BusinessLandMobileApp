import 'package:businessland_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAuthInput extends StatelessWidget {
  CustomAuthInput({@required this.labelText , this.isObscure , this.inputType , this.validator , this.saveFunction , this.changeFunction , this.fillColor , this.textColor , this.errorText});
  final String labelText;
  final bool isObscure;
  final Color textColor;
  final Color fillColor;
  final TextInputType inputType;
  final String errorText;
  final Function validator;
  final Function saveFunction;
  final Function changeFunction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontFamily: 'Rajdhani',
          color: textColor,
          fontSize: 15.0,
          fontWeight: FontWeight.bold
      ),
      keyboardType: inputType,
      obscureText: this.isObscure,
      decoration: kAuthTextFieldsDecoration.copyWith(
        errorText: this.errorText,
        fillColor: this.fillColor,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
              borderRadius: BorderRadius.circular(16.0)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red
            ),
              borderRadius: BorderRadius.circular(16.0)
          ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Color(0xff3F485F)
            ),
            borderRadius: BorderRadius.circular(16.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color :Color(0xff8780F0)
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
          labelText: this.labelText
      ),
      validator: this.validator,
      onSaved: this.saveFunction,
      onChanged: changeFunction,
    );
  }
}
