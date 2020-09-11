import 'dart:async';

mixin RegisterValidaton {
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (email,sink) {
        if(RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(email)) {
          sink.add(email);
        }else{
          sink.addError("Invalid Address Email.");
        }
      }
  );
  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink) {
        if(password.length > 5) {
          sink.add(password);
        }else{
          sink.addError("Password length should be greater than 5.");
        }
      }
  );

  var firstNameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (value , sink)  {
        if(value.length > 2) {
          sink.add(value);
        }else{
          sink.addError("First Name should be greater than 2.");
        }
      }
  );

  var lastNameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (value , sink)  {
        if(value.length > 2) {
          sink.add(value);
        }else{
          sink.addError("Last Name should be greater than 2.");
        }
      }
  );

  var usernameValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (value , sink)  {
        if(value.length > 2) {
          sink.add(value);
        }else{
          sink.addError("Username should be greater than 2.");
        }
      }
  );

  var ageValidator = StreamTransformer<String,int>.fromHandlers(
      handleData: (value , sink) {
        try {
          int age = int.parse(value);
          if(age >= 10 && age <= 80) {
            sink.add(age);
          }else{
            sink.addError("Age should be between 10 and 80.");
          }
        }catch(e) {
          sink.addError("Age should be a number.");
        }
      }
  );

}