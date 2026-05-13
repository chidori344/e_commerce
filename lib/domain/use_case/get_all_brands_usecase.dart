import 'package:dartz/dartz.dart';

import '../entity/category_respons_or_brand_entity.dart';
import '../entity/failures.dart';
import '../repository/repository/Home_repository_contract.dart';

class GetAllBrandsUsecase {
  HomeRepositoryContract repositoryContract;
  GetAllBrandsUsecase({required this.repositoryContract});
  Future<Either<Failures,CategoryOrBrandResponseEntity>>invoke(){
    return repositoryContract.getAllBrands();

  }


}