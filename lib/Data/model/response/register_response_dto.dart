
import 'package:e_commerce/domain/entity/Auth_Result_Entity.dart';

import 'User_dto.dart';
import 'errors.dart';


class RegisterResponseDto {
  String? message;
  String? token;
  String? statusMsg;
  Errors? error;
  UserDto? user;





  RegisterResponseDto({
    this.message, this.token,this.error, this.statusMsg,this.user
  });

  RegisterResponseDto copyWith({
    String? message, String? token
  }) =>
      RegisterResponseDto(message: message ?? this.message,

          token: token ?? this.token);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["message"] = message;
    map["statusMsg"] = statusMsg;

   if (error != null) {
      map["errors"] = error?.toJson();
    }
   if (user != null) {
     map["user"] = user?.toJson();
   }
    map["token"] = token;
    return map;
  }

  RegisterResponseDto.fromJson(dynamic json) {
    message = json["message"] ?? "";

    error = json["error"] != null ? Errors.fromJson(json["error"]) : null;
    token = json["token"] ?? "";
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
        userEntity: user!.toUserEntity(),
        token: token!);
  }
}