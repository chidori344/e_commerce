
import 'package:e_commerce/domain/repository/datasource/auth_remote_datasource.dart';
import 'package:e_commerce/domain/repository/datasource/cart_remote_datasource.dart';
import 'package:e_commerce/domain/repository/datasource/home_remote_data_source.dart';
import 'package:e_commerce/domain/repository/repository/Home_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';
import 'package:e_commerce/domain/use_case/add_to_cart_usecase.dart';
import 'package:e_commerce/domain/use_case/delete_item%20_in_cart_usecase.dart';
import 'package:e_commerce/domain/use_case/get_all_brands_usecase.dart';
import 'package:e_commerce/domain/use_case/get_all_categories_usecase.dart';
import 'package:e_commerce/domain/use_case/get_all_product_usecase.dart';
import 'package:e_commerce/domain/use_case/get_cart_usecase.dart';
import 'package:e_commerce/domain/use_case/login_usecase.dart';
import 'package:e_commerce/domain/use_case/register_usecase.dart';
import 'package:e_commerce/domain/use_case/update_count%20_in_cart_usecase.dart';

import '../Data/api/api_manager.dart';
import '../Data/repository/auth_repository/datasource/Home_Remote_Datasource_impl.dart';
import '../Data/repository/auth_repository/datasource/auth_remote_data_source_impl.dart';
import '../Data/repository/auth_repository/datasource/cart_remote_data_source-impl.dart';
import '../Data/repository/auth_repository/repository/auth_repository_impl.dart';
import '../Data/repository/auth_repository/repository/cart_repository_impl.dart';
import '../Data/repository/auth_repository/repository/home_repository_impl.dart';

AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDatasource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
GetAllCategoriesUsecase injectGetAllCategoriesUsecase(){
  return GetAllCategoriesUsecase(repositoryContract: injectHomeRepositoryContract());
}
GetAllBrandsUsecase injectGetAllBrandsUsecase(){
  return GetAllBrandsUsecase(repositoryContract: injectHomeRepositoryContract());
}
GetAllProductUsecase injectGetAllProductsUsecase(){
  return GetAllProductUsecase(repositoryContract: injectHomeRepositoryContract());
}
AddToCartUsecase injectAddToCartUsecase(){
  return AddToCartUsecase(repositoryContract: injectHomeRepositoryContract());
}
DeleteItemInCartUseCase injectDeleteItemInCartUsecase(){
  return DeleteItemInCartUseCase (repositoryContract: injectCartRepositoryContract());

}
UpdateCountInCartUseCase injectUpdateCountInCartUseCase(){
  return UpdateCountInCartUseCase (repositoryContract: injectCartRepositoryContract());

}
GetCartUsecase injectGetCartUsecase(){
  return GetCartUsecase(repositoryContract: injectCartRepositoryContract() );

}
CartRepositoryContract injectCartRepositoryContract(){
  return CartRepositoryImpl(cartRemoteDatasource: injectcartRemoteDataSource());
}
CartRemoteDatasource injectcartRemoteDataSource(){
  return CartRemoteDataSourceimpl(apiManager: ApiManager.getInstance());
}

HomeRepositoryContract injectHomeRepositoryContract(){
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}
HomeRemoteDataSource injectHomeRemoteDataSource(){
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}