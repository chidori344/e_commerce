import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/add__to_cart_respose_entity.dart';

import '../../entity/category_respons_or_brand_entity.dart';
import '../../entity/failures.dart';
import '../../entity/product_response_entity.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  Future<Either<Failures,AddToCartResposeEntity>> addToCart(String productId);

}