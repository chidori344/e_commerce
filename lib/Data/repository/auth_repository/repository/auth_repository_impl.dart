import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/repository/auth_repository/datasource/auth_remote_data_source_impl.dart';

import '../../../../domain/entity/Auth_Result_Entity.dart';
import '../../../../domain/entity/failures.dart';
import '../../../../domain/repository/datasource/auth_remote_datasource.dart';
import '../../../../domain/repository/repository/auth_repository_contract.dart';

 class AuthRepositoryImpl implements AuthRepositoryContract {
   AuthRemoteDatasource remoteDataSource;
   AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures,AuthResultEntity>> register(String? name, String? email,
      String? password, String? rePassword, String? phone)  {
    // TODO: implement register
    return  remoteDataSource.register(name, email,
        password, rePassword, phone);


  }

}

AuthRepositoryContract injectAuthRepositoryContract(){
   return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}