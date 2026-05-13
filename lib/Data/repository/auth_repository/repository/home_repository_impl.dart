import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/add__to_cart_respose_entity.dart';
import 'package:e_commerce/domain/entity/category_respons_or_brand_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/product_response_entity.dart';
import 'package:e_commerce/domain/repository/repository/Home_repository_contract.dart';
import 'package:e_commerce/domain/use_case/get_all_categories_usecase.dart';

import '../../../../domain/repository/datasource/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
return remoteDataSource.getAllCategories();

  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
  return remoteDataSource.getAllBrands();

  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddToCartResposeEntity>> addToCart(String productId) {
    return remoteDataSource.addToCart(productId);

  }

}