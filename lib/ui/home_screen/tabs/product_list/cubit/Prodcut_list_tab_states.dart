import 'package:e_commerce/domain/entity/failures.dart';

import '../../../../../domain/entity/add__to_cart_respose_entity.dart';
import '../../../../../domain/entity/product_response_entity.dart';

abstract class ProductListTabStates {}
class ProductListTabIntialState extends ProductListTabStates{}
class ProductListTabLoadingState extends ProductListTabStates{
   String? loadingMessage;
  ProductListTabLoadingState({required this.loadingMessage});
}
class ProductListTabErrorState extends ProductListTabStates{
  Failures errors;
  ProductListTabErrorState({required this.errors});
}
class ProductListTabSuccessState extends ProductListTabStates{
  ProductResponseEntity productResponseEntity;
  ProductListTabSuccessState({required this.productResponseEntity});
}
class AddToCartLoadingState extends ProductListTabStates{
   String? loadingMessage;
  AddToCartLoadingState({required this.loadingMessage});
}
class AddToCartErrorState extends ProductListTabStates{
  Failures errors;
  AddToCartErrorState({required this.errors});
}
class AddToCartSuccessState extends ProductListTabStates{
  AddToCartResposeEntity addToCartResposeEntity;
  AddToCartSuccessState({required this.addToCartResposeEntity});
}


