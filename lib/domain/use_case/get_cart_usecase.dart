import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';

import '../entity/get_cart_response_entity.dart';

class GetCartUsecase {
  CartRepositoryContract repositoryContract;
  GetCartUsecase({required this.repositoryContract});
Future<Either<Failures,GetCartResponseEntity>> invoke(){
  return repositoryContract.getCart();

}


}