import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import '../../Data/repository/auth_repository/repository/auth_repository_impl.dart';
import '../entity/Auth_Result_Entity.dart';
import '../entity/failures.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});

Future<Either<Failures,AuthResultEntity>>invoke(
    String? name, String? email, String? password,
    String? rePassword, String? phone){
 return repositoryContract.register(name, email, password, rePassword, phone);

}

}
