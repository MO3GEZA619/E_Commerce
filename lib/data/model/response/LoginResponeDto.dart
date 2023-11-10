import 'package:ecommerceapp/data/model/response/UserDto.dart';
import 'package:ecommerceapp/domain/entity/auth_result_entity.dart';

/// message : "success"
/// user : {"name":"Mohamed-adel","email":"mo3geza@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGQ3ZWEzN2I5MTdlNTY3NDg0YzU5ZSIsIm5hbWUiOiJhaG1lZC1tb2hhbWVkLWZhdGh5Iiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTk1Nzc3MjcsImV4cCI6MTcwNzM1MzcyN30.OyqAuyoIgnPIXeiEFvKP13fMP5hvuWJaeO2MRIeIBoQ"

class LoginResponeDto {
  LoginResponeDto({
      this.message, 
      this.user, 
      this.token,
    this.statusMsg
  });

  LoginResponeDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(userEntity: user?.toUserEntity(), token: token);
  }

}

/// name : "Mohamed-adel"
/// email : "mo3geza@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }


}