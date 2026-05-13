import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/product_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/Home_repository_contract.dart';

import '../entity/failures.dart';

class GetAllProductUsecase {
HomeRepositoryContract repositoryContract;
GetAllProductUsecase({required this.repositoryContract});
Future<Either<Failures, ProductResponseEntity>> invoke(){
  return repositoryContract.getAllProducts();

}
}