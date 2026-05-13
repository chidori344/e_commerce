
import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/product_response_entity.dart';
import 'package:e_commerce/domain/use_case/add_to_cart_usecase.dart';
import 'package:e_commerce/domain/use_case/get_all_product_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Prodcut_list_tab_states.dart';



class ProductListTabViewModel extends Cubit<ProductListTabStates>{
  GetAllProductUsecase getAllProductUseCase;
  AddToCartUsecase addToCartUsecase;
  num numOfCartItems=0;
  List <ProductEntity> productList =[];
  static ProductListTabViewModel get(context)=>BlocProvider.of(context);

  ProductListTabViewModel({required this.getAllProductUseCase,required this.addToCartUsecase}):super(ProductListTabIntialState());
  void getProducts()async{
  emit(ProductListTabLoadingState(loadingMessage: "Loading"));
 var either= await getAllProductUseCase.invoke();
 either.fold((l){
emit(ProductListTabErrorState(errors: l));
 },(response){
   productList=response.dataList??[];
   emit(ProductListTabSuccessState(productResponseEntity: response));

     });
}
void addToCart(String productId)async{
  emit(AddToCartLoadingState(loadingMessage: "Loading"));
 var either= await addToCartUsecase.invoke(productId);
 either.fold((l){
emit(AddToCartErrorState(errors: l));
 },(response){
   numOfCartItems = response.numOfCartItems?? 0;
   print('numOfCartItems: $numOfCartItems');
   emit(AddToCartSuccessState(addToCartResposeEntity: response));

     });
}
}



