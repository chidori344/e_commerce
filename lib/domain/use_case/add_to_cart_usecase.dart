import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/Home_repository_contract.dart';

import '../entity/add__to_cart_respose_entity.dart';
import '../entity/failures.dart';

class AddToCartUsecase {
  HomeRepositoryContract repositoryContract;
  AddToCartUsecase({required this.repositoryContract});
  Future<Either<Failures,AddToCartResposeEntity>> invoke(String productId){
    return repositoryContract.addToCart(productId);

  }
}