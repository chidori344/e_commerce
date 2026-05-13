import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repository/repository/Home_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';

import '../entity/category_respons_or_brand_entity.dart';
import '../entity/failures.dart';

class GetAllCategoriesUsecase {
 HomeRepositoryContract repositoryContract;
  GetAllCategoriesUsecase({required this.repositoryContract});
  Future<Either<Failures,CategoryOrBrandResponseEntity>>invoke(){
return repositoryContract.getAllCategories();

  }


}