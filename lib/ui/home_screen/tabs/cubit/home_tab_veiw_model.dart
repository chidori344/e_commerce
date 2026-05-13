import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_case/get_all_categories_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/category_respons_or_brand_entity.dart';
import '../../../../domain/use_case/get_all_brands_usecase.dart';
import 'home_tab_states.dart';

class HomeTabVeiwModel  extends Cubit<HomeTabState>{
  GetAllCategoriesUsecase getAllCategoriesUsecase;
  GetAllBrandsUsecase getAllBrandsUsecase;
  HomeTabVeiwModel( {required this.getAllCategoriesUsecase,required this.getAllBrandsUsecase}):super(HomeTabintialState());
 List<CategoryOrBrandEntity> categoriesList=[];
 List<CategoryOrBrandEntity> BrandsList=[];
  static HomeTabVeiwModel get(context)=>BlocProvider.of(context);

  void getCategories()async{
    emit(HomeTabCategoryLoadingState());
   var either = await getAllCategoriesUsecase.invoke();
   return either.fold((l){
     emit(HomeTabCategoryErrorState(errorMassage: l.errorMessage ));
   }, (response){
     categoriesList=response.dataList!;
     emit(HomeTabCategorySuccessState(categoryEntity: response));
   });
   }
  void getAllBrands()async{
    emit(HomeTabBrandLoadingState());
   var either = await getAllBrandsUsecase.invoke();
   return either.fold((l){
     emit(HomeTabBrandErrorState(errors: l ));
   }, (response){
     BrandsList=response.dataList! ;
     emit(HomeTabBrandSuccessState(categoryOrBrandEntity  : response));
   });
   }
  }


