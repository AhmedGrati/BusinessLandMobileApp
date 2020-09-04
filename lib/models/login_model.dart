import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {

  String email;
  String password;

  LoginModel({this.email , this.password});

  factory LoginModel.fromJson(Map<String, dynamic> item) => _$LoginModelFromJson(item);

  Map<String,dynamic> toJson() => _$LoginModelToJson(this);
}