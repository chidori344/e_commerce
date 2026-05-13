import 'package:dartz/dartz.dart';

import 'package:e_commerce/domain/entity/failures.dart';

import 'package:e_commerce/domain/entity/get_cart_response_entity.dart';

import '../../../../domain/repository/datasource/cart_remote_datasource.dart';
import '../../../../domain/repository/repository/cart_repository_contract.dart';

class CartRepositoryImpl implements CartRepositoryContract {
  final CartRemoteDatasource cartRemoteDatasource;
  CartRepositoryImpl({required this.cartRemoteDatasource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async{
    return await cartRemoteDatasource.getCart();


  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String prouctId)async {
    return await cartRemoteDatasource.deleteItemInCart(prouctId);

  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> UpdateCountInCart(String prouctId,int Count) {
    return cartRemoteDatasource.UpdateCountInCart(prouctId,Count);

  }

}