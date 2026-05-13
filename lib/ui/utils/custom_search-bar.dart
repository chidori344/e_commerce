import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cart/cart_view.dart';
import '../home_screen/tabs/product_list/cubit/Prodcut_list_tab_states.dart';
import '../home_screen/tabs/product_list/cubit/product_list_tab_view_model.dart';
import 'custom_text_field.dart';
import 'my_assets.dart';
import 'my_theme.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  const CustomSearchWithShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(),
        ),
        SizedBox(width: 24.w),

        // Only ONE InkWell for the shopping cart
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: InkWell(
            onTap: () {
              print("DEBUG: Tapped on Cart Icon"); //

              Navigator.of(context).pushNamed(CartView.routeName);
            },
            child: BlocBuilder<ProductListTabViewModel, ProductListTabStates>(
              builder: (context, state) {
                return Badge(
                  label: Text(
                    ProductListTabViewModel.get(context).numOfCartItems.toString(),
                  ),
                  child: ImageIcon(
                    AssetImage(MyAssets.shoppingCart),
                    size: 28.sp,
                    color: MyTheme.primaryLight,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(width: 15.w)
      ],
    );
  }
}
