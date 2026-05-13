import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';

import '../../entity/get_cart_response_entity.dart';

abstract class CartRepositoryContract {
 Future<Either<Failures,GetCartResponseEntity>> getCart();
 Future<Either<Failures,GetCartResponseEntity>> deleteItemInCart(String prouctId);
 Future<Either<Failures,GetCartResponseEntity>> UpdateCountInCart(String prouctId,int count);
}