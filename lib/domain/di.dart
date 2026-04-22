
import 'package:e_commerce/domain/repository/datasource/auth_remote_datasource.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/domain/use_case/login_usecase.dart';
import 'package:e_commerce/domain/use_case/register_usecase.dart';

import '../Data/api/api_manager.dart';
import '../Data/repository/auth_repository/datasource/auth_remote_data_source_impl.dart';
import '../Data/repository/auth_repository/repository/auth_repository_impl.dart';

AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDatasource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}