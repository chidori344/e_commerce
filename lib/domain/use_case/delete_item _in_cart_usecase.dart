import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';

import '../entity/failures.dart';
import '../entity/get_cart_response_entity.dart';

class DeleteItemInCartUseCase{
CartRepositoryContract repositoryContract;
DeleteItemInCartUseCase({required this.repositoryContract});

Future<Either<Failures, GetCartResponseEntity>>invoke(String prouctId){
  return repositoryContract.deleteItemInCart(prouctId);
}

}