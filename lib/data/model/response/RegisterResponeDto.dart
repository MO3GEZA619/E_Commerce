

import 'package:ecommerceapp/data/model/response/Errors.dart';
import 'package:ecommerceapp/domain/entity/auth_result_entity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Mohamed-adel","email":"mo3geza@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGQyNWY0NzU5Y2I3NDVkMjAxMWZlNSIsIm5hbWUiOiJvbWFyLW1vaGFtZWQtbW9zdGFmYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NTU0ODA1LCJleHAiOjE3MDczMzA4MDV9.3E-0Qh23_JiU30GIADZvBUqWoSM1hvG71WezOFEfUO0"

class RegisterResponeDto {
  RegisterResponeDto({
      this.message, 
      this.user, 
      this.token,
  this.statusMsg,
  this.error});

  RegisterResponeDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Errorr.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Errorr? error;

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