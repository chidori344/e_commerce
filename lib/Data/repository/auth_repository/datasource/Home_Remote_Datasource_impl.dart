import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/api/api_manager.dart';
import 'package:e_commerce/domain/entity/add__to_cart_respose_entity.dart';
import 'package:e_commerce/domain/entity/product_response_entity.dart';

import '../../../../domain/entity/category_respons_or_brand_entity.dart';
import '../../../../domain/entity/failures.dart';
import '../../../../domain/repository/datasource/home_remote_data_source.dart';

 class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
   ApiManager apiManager;
   HomeRemoteDataSourceImpl ({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() async {
 var either = await apiManager.getAllCategories();
 return either.fold((l){
   return Left(Failures(errorMessage: l.errorMessage));
 }, (response){
return Right(response.toCategoryEntity());
 }
 );

  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    },(response){
      return Right(response.toCategoryEntity());
    }
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
  var either= await apiManager.getAllProducts();
  return either.fold((l){
    return Left(Failures(errorMessage: l.errorMessage));

  },(response){
    return Right(response);
  });
  }

  @override
  Future<Either<Failures, AddToCartResposeEntity>> addToCart(String productId)async {
    var either= await apiManager.addToCart(productId);
    return either.fold((l){
return Left(Failures(errorMessage: l.errorMessage));
    },(response){
      return Right(response);
    });
  }
      }




