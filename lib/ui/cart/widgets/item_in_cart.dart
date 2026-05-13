import 'package:e_commerce/domain/entity/get_cart_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../cubit/cart_view_model.dart';
import 'add_remove_items_incart_widget.dart';

class ItemInCart extends StatelessWidget {

  GetProductsCartEntity getProduct;
  ItemInCart({required this.getProduct});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), // Reduced vertical padding
      child: Container(
        height: 113.h,
        width: 398.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: MyColors.primaryColor.withOpacity(0.3),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            // 1. Image Section
            Container(
              width: 120.w,
              height: 113.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), // Match parent radius
                border: Border.all(color: MyColors.primaryColor.withOpacity(0.3), width: 1.w),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(getProduct.product?.imageCover??" ", fit: BoxFit.cover),
              ),
            ),

            SizedBox(width: 8.w),

            // 2. Info Section (Title & Price)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getProduct.product?.title??" ",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "EGP ${getProduct.price}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3. Actions Section (Delete & Counter)
            Padding(
              padding: EdgeInsets.only(right: 8.w, bottom: 8.h, top: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {

                      CartViewModel.get(context).deleteItemInCart(getProduct.product?.id??"");
                    },
                    icon: Icon(Icons.delete_outline_rounded, color: MyColors.primaryColor, size: 24.sp),
                  ),
              Container(
                height: 35.h,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    100.r,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        var Counter = getProduct.count?.toInt()??0;
                        Counter--;
                        CartViewModel.get(context).UpdateCountInCart(getProduct.product?.id??"",
                            Counter);
                      },
                      icon: Icon(
                        Icons.remove_circle_outline_rounded,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    ),
                    Text(
                      getProduct.count.toString(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        var Counter = getProduct.count?.toInt()??0;
                        Counter++;
                        CartViewModel.get(context).UpdateCountInCart(getProduct.product?.id??"",
                            Counter);
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                    ),
                  ],
                ),
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
