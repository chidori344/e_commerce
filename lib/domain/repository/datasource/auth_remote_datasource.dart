
import 'package:dartz/dartz.dart';

import '../../entity/Auth_Result_Entity.dart';
import '../../entity/failures.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failures,AuthResultEntity>> register(String? name, String? email, String? password,
      String? rePassword, String? phone);
}