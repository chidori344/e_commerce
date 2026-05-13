import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/get_cart_response_entity.dart';
import 'package:e_commerce/domain/repository/datasource/cart_remote_datasource.dart';

import '../../../api/api_manager.dart';

class CartRemoteDataSourceimpl implements CartRemoteDatasource {
  ApiManager apiManager;
  CartRemoteDataSourceimpl ({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart()async {
    var either= await apiManager.getCart();
    return either.fold((l){
      return Left(Failures(errorMessage: l.errorMessage));

    },(response){
      return Right(response);
    });;
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String prouctId) async{
    var either= await apiManager.deleteItemInCart(prouctId);
    return either.fold((l){
      return Left(Failures(errorMessage: l.errorMessage));

    },(response){
      return Right(response);
    });;
  }
  Future<Either<Failures, GetCartResponseEntity>> UpdateCountInCart(String prouctId,int Count) async{
    var either= await apiManager.UpdateCountInCart(prouctId,Count);
    return either.fold((l){
      return Left(Failures(errorMessage: l.errorMessage));

    },(response){
      return Right(response);
    });;
  }
}