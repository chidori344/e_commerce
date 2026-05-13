

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/get_cart_response_entity.dart';
import '../../../domain/use_case/delete_item _in_cart_usecase.dart';
import '../../../domain/use_case/get_cart_usecase.dart';
import '../../../domain/use_case/update_count _in_cart_usecase.dart';
import 'cart_states.dart';

class CartViewModel extends Cubit<CartStates> {
  UpdateCountInCartUseCase updateCountInCart;
  GetCartUsecase getCartUsecase;
  DeleteItemInCartUseCase deleteItemInCartUsecase;
  CartViewModel({required this.getCartUsecase,
    required this.deleteItemInCartUsecase,
    required this.updateCountInCart
    })
      :super( GetCartIntialState());
  List<GetProductsCartEntity> productCartList=[];
  int numOfCartItems = 0; // 1. Add this variable

  static CartViewModel get(context) => BlocProvider.of(context);
  getCart()async{
    {
      emit(GetCartLoadingState(loadingMessage: "Loading"));
      var either= await getCartUsecase.invoke();
      either.fold((l){
        emit(GetCartErrorState(errors: l));
      },(response){
        productCartList=response.data?.productsList??[];
        numOfCartItems = response.numOfCartItems?.toInt() ?? 0; // 2. Update count
        emit(GetCartSuccessState(getCartResponseEntity: response));

      });
    }
  }
  deleteItemInCart(String productId)async{
    {
      emit(DeleteItemInCartLoadingState(loadingMessage: "Loading"));
      var either= await deleteItemInCartUsecase.invoke(productId);
      either.fold((l){
        emit(DeleteItemInCartErrorState(errors: l));
      },(response){
        // productCartList=response.data?.productsList??[];
        numOfCartItems = response.numOfCartItems?.toInt() ?? 0; // 2. Update count
        emit(GetCartSuccessState(getCartResponseEntity: response));

      });
    }
  }
  UpdateCountInCart(String productId,int Count)async{
    {
      emit(UpdateCountInCartUseCaseLoadingState(loadingMessage: "Loading"));
      var either= await updateCountInCart.invoke(productId,Count);
      either.fold((l){
        emit(UpdateCountInCartUseCaseErrorState(errors: l));
      },(response){
        // productCartList=response.data?.productsList??[];
        numOfCartItems = response.numOfCartItems?.toInt() ?? 0; // 2. Update count
        emit(GetCartSuccessState(getCartResponseEntity: response));

      });
    }
  }

}