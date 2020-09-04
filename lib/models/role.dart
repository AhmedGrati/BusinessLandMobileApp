import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';
@JsonSerializable()
class Role {

  String id;
  String name;
  Role({this.id,this.name});

  factory Role.fromJson(Map<String, dynamic> item) => _$RoleFromJson(item);

  Map<String,dynamic> toJson() => _$RoleToJson(this);

}