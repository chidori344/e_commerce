import 'package:e_commerce/domain/entity/User_Entity.dart';

class AuthResultEntity {
  UserEntity userEntity;
  String token;

  AuthResultEntity({required this.userEntity, required this.token});
}


