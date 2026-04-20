
import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import '../../entity/Auth_Result_Entity.dart';

abstract class AuthRepositoryContract{
  Future<Either<Failures,AuthResultEntity>> register(String? name, String? email, String? password,
      String? rePassword, String? phone);
}