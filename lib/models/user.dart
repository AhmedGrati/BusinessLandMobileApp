import 'gender.dart';
import 'package:json_annotation/json_annotation.dart';
import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  String  id;
  String username;
  String email;
  String firstName;
  String lastName;
  String password;
  List<String> authorities;
  int age;
  Role role;
  Gender gender;
  String resetToken;

  User({
    this.gender,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.authorities,
    this.role,
    this.age,
    this.resetToken
  });

  factory User.fromJson(Map<String, dynamic> item) => _$UserFromJson(item);

  Map<String,dynamic> toJson() => _$UserToJson(this);

}