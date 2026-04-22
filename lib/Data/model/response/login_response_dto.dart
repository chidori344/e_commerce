
import 'package:e_commerce/Data/model/response/User_dto.dart';

import '../../../domain/entity/Auth_Result_Entity.dart';

class LoginResponseDto {
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;


  LoginResponseDto({
    this.message, this.user, this.token,this.statusMsg
  });

  LoginResponseDto copyWith({
    String? message, UserDto? user, String? token
  }) =>
      LoginResponseDto(message: message ?? this.message,
          user: user ?? this.user,
          token: token ?? this.token);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["message"] = message;
    map["statusMsg"] = statusMsg;
    if (user != null) {
      map["user"] = user?.toJson();
    }
    map["token"] = token;
    return map;
  }

  LoginResponseDto.fromJson(dynamic json) {
    message = json["message"] ?? "";
    user = json["user"] != null ? UserDto.fromJson(json["user"]) : null;
    token = json["token"] ?? "";
    statusMsg = json["statusMsg"] ?? "";

  }AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
        userEntity: user!.toUserEntity(),
        token: token!);
  }
}