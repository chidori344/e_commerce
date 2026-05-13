import 'package:e_commerce/domain/entity/failures.dart';

import '../../../../domain/entity/category_respons_or_brand_entity.dart';

abstract class HomeTabState {}
class HomeTabintialState extends HomeTabState{}
class HomeTabCategoryLoadingState extends HomeTabState{
  String? loadingMassage;
  HomeTabCategoryLoadingState({this.loadingMassage});
}
class HomeTabCategoryErrorState extends HomeTabState{

  String? errorMassage;
  HomeTabCategoryErrorState({required this.errorMassage});
}
class HomeTabCategorySuccessState extends HomeTabState{

  CategoryOrBrandResponseEntity? categoryEntity;
  HomeTabCategorySuccessState({required this.categoryEntity});

}
class HomeTabBrandLoadingState extends HomeTabState{
  String? loadingMassage;
  HomeTabBrandLoadingState({this.loadingMassage});
}
class HomeTabBrandErrorState extends HomeTabState{
  Failures errors;
  HomeTabBrandErrorState({required this.errors});
}
class HomeTabBrandSuccessState extends HomeTabState{

  CategoryOrBrandResponseEntity? categoryOrBrandEntity;
  HomeTabBrandSuccessState({required this.categoryOrBrandEntity});

}