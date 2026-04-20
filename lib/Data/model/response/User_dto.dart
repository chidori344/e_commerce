
import '../../../domain/entity/User_Entity.dart';

class UserDto {
  String? name;
  String? email;


  UserDto({
    this.name, this.email,
  });

  UserDto copyWith({
    String? name, String? email, String? role
  }) =>
      UserDto(name: name ?? this.name,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
    };
    map["name"] = name;
    map["email"] = email;

    return map;
  }

  UserDto.fromJson(dynamic json) {
    name = json["name"] ?? "";
    email = json["email"] ?? "";

  }
  UserEntity toUserEntity(){
    return UserEntity(
        name: name,
        email: email);
  }

}