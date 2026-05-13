// ... existing imports

import 'package:e_commerce/ui/cart/widgets/item_in_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/di.dart';
import '../utils/my_colors.dart';
import 'cubit/cart_states.dart';
import 'cubit/cart_view_model.dart';

class CartView extends StatelessWidget {
  static const String routeName = "cart-view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartViewModel(
        getCartUsecase: injectGetCartUsecase(),
        deleteItemInCartUsecase: injectDeleteItemInCartUsecase(),
        updateCountInCart: injectUpdateCountInCartUseCase(),
      )..getCart(),
      child: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Cart",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyColors.primaryColor),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search, color: MyColors.primaryColor)),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined, color: MyColors.primaryColor)),
              ],
            ),
            body: _buildBody(state),
            // Pass the price from the state to the bottom nav
            bottomNavigationBar: _buildBottomNav(
                context,
                state is GetCartSuccessState
                    ? state.getCartResponseEntity.data?.totalCartPrice?.toString() ?? "0"
                    : "0"
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(CartStates state) {
    if (state is GetCartSuccessState) {
      final products = state.getCartResponseEntity.data?.productsList ?? [];
      return ListView.builder(
        itemCount: products.length,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemBuilder: (context, index) => ItemInCart(getProduct: products[index]),
      );
    } else if (state is GetCartErrorState) {
      return const Center(child: Text("Something went wrong"));
    }
    return Center(child: CircularProgressIndicator(color: MyColors.primaryColor));
  }

  // Updated to accept total price
  Widget _buildBottomNav(BuildContext context, String totalPrice) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Price", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
              Text("EGP $totalPrice",
                  style: TextStyle(color: MyColors.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.bold)
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
            ),
            child: Row(
              children: [
                Text("Check Out", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(width: 8.w),
                const Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
