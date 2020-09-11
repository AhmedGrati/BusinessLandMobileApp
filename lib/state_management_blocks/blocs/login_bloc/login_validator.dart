import 'dart:async';


mixin Validator {
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink) {
      if(RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(email)) {
        sink.add(email);
      }else{
        sink.addError("Invalid Address Email");
      }
    }
  );
  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink) {
        if(password.length > 5) {

          sink.add(password);
        }else{
          sink.addError("Password length should be greater than 5");
        }
      }
  );

  var passwordConfirmationValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink) {
        if(password.length > 5) {
          print("length : ${password.length}");
          sink.add(password);
        }else{
          sink.addError("Password Confirmation length should be greater than 5");
        }
      }
  );

  var nameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (value , sink)  {
      if(value.length > 2) {
        sink.add(value);
      }else{
        sink.addError("Invalid");
      }
    }
  );

  var ageValidator = StreamTransformer<String,int>.fromHandlers(
    handleData: (value , sink) {
      try{
        int age = int.parse(value);
          sink.add(age);
          //sink.addError("age should be between 80 and 10");
      }catch(e) {
        sink.addError("age should be number.");
      }
    }
  );


}