import '../../../domain/entity/failures.dart';
import '../../../domain/entity/get_cart_response_entity.dart';

abstract class CartStates {}
class GetCartIntialState extends CartStates{}
class GetCartLoadingState extends CartStates{
  String? loadingMessage;
  GetCartLoadingState({required this.loadingMessage});
}
class GetCartErrorState extends CartStates{
  Failures errors;
  GetCartErrorState({required this.errors});
}
class GetCartSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  GetCartSuccessState({required this.getCartResponseEntity});
}
class DeleteItemInCartLoadingState extends CartStates{
  String? loadingMessage;
  DeleteItemInCartLoadingState({required this.loadingMessage});
}
class DeleteItemInCartErrorState extends CartStates{
  Failures errors;
  DeleteItemInCartErrorState({required this.errors});
}
class DeleteItemInCartSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  DeleteItemInCartSuccessState({required this.getCartResponseEntity});
}
class UpdateCountInCartUseCaseLoadingState extends CartStates{
  String? loadingMessage;
  UpdateCountInCartUseCaseLoadingState({required this.loadingMessage});
}
class UpdateCountInCartUseCaseErrorState extends CartStates{
  Failures errors;
  UpdateCountInCartUseCaseErrorState({required this.errors});
}
class UpdateCountInCartUseCaseSuccessState extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  UpdateCountInCartUseCaseSuccessState({required this.getCartResponseEntity});
}