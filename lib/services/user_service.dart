import 'package:businessland_app/global_config.dart';
import 'package:businessland_app/models/api_response.dart';
import 'package:businessland_app/models/login_model.dart';
import 'package:businessland_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserService {

  Future<ApiResponse<User>> login(LoginModel loginModel) {
    final String url = GlobalConfig.API_URL+'/login';
    print(url);
    return http.post(
      url ,
      headers: GlobalConfig.headers,
      body: json.encode(loginModel.toJson())
    ).then((response) {

      if(response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final User user = User.fromJson(jsonData['user']);
        return ApiResponse<User>(data: user);
      }else{
        return ApiResponse<User>(error: true, errorMessage: 'Your email and password are invalid!');
      }
    }).catchError((error){
        print(error.toString());
        return ApiResponse<User>(error: true, errorMessage: 'An error occured. Please retry later.');
      }
     );
  }

  Future<ApiResponse<bool>> sendResetPasswordEmail(String email) {
    print("email : $email");
    final String url = GlobalConfig.API_URL+'/api/user/sendEmail?email=$email';
    print(url);
    return  http.get(
      url,
      headers: GlobalConfig.headers
      ).then((response) {
        if(response.statusCode == 200) {
          print('email sent');
          return ApiResponse<bool>(data: true);
        }else{
          print('else email sent');
          return ApiResponse<bool>(error : true , data: false,errorMessage: "Your email is invalid! Please check it.");
        }
      }
    ).catchError((error) {
      print('error sent');
      return ApiResponse<bool>(error : true , data: false,errorMessage: "An error occured. Please retry later.");
    });
  }
  Future<ApiResponse<bool>> registerUser(User user) {
    final String url = GlobalConfig.API_URL+'/api/user/register';
    return http.post(
      url,
      headers:GlobalConfig.headers,
      body:json.encode(user.toJson())
    ).then((response) {
      if(response.statusCode == 200) {
        return ApiResponse<bool>(data:true);
      }else{
        return ApiResponse<bool>(error: true , data:false , errorMessage: "Username or Email already exists!");
      }
    }
    ).catchError((error) {
      return ApiResponse<bool>(error : true , data: false,errorMessage: "An error occured. Please retry later.");
    });
  }
}