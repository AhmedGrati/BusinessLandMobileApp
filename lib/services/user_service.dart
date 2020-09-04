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
        return ApiResponse<User>(error: true, errorMessage: 'An error occured');
      }
    }).catchError((error){
      print(error.toString());
      return ApiResponse<User>(error: true, errorMessage: 'An error occured');
    }
      );
  }

}