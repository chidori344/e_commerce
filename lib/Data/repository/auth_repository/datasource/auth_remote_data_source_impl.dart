import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/api/api_manager.dart';


import '../../../../domain/entity/Auth_Result_Entity.dart';
import '../../../../domain/entity/failures.dart';
import '../../../../domain/repository/datasource/auth_remote_datasource.dart';
import '../../../../ui/auth/register screen/register_screen.dart' as apiManager;

 class AuthRemoteDataSourceImpl implements AuthRemoteDatasource  {
ApiManager apiManager;
AuthRemoteDataSourceImpl({required this.apiManager });

  Future<Either<Failures,AuthResultEntity>> register(String? name, String? email, String? password,
      String? rePassword, String? phone)async{
 var either= await apiManager.register(name, email, password, rePassword, phone);
return either.fold((l){
  return Left(Failures(errorMessage: l.errorMessage));
},
        (response){
  return Right(response.toAuthResultEntity());
});

  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String? email, String? password)async {
  var either= await apiManager.login(email, password);
  return either.fold((l){
    return Left(Failures(errorMessage: l.errorMessage));

  }, (response){
    return Right(response.toAuthResultEntity());
  });
  }

}
