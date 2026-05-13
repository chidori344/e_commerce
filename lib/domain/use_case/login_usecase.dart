import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import '../../Data/repository/auth_repository/repository/auth_repository_impl.dart';
import '../di.dart';
import '../entity/Auth_Result_Entity.dart';
import '../entity/failures.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});

Future<Either<Failures,AuthResultEntity>>invoke(
     String? email, String? password,
    ){
 return repositoryContract.login( email, password);

}

}
