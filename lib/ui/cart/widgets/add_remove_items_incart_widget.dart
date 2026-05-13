
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/my_colors.dart';

class AddRemoveItemsInCartWidget extends StatefulWidget {
  final int itemsInCart;

  const AddRemoveItemsInCartWidget({
    super.key,
    required this.itemsInCart,
  });

  @override
  State<AddRemoveItemsInCartWidget> createState() => _AddRemoveItemsInCartWidgetState();
}

class _AddRemoveItemsInCartWidgetState extends State<AddRemoveItemsInCartWidget> {
  late int itemsInCart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemsInCart = widget.itemsInCart;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 120.w,
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
              if (itemsInCart != 0) {
                itemsInCart--;
                setState(() {});
              }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: Colors.white,
              size: 28.sp,
            ),
          ),
          Text(
            itemsInCart.toString(),
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (itemsInCart != 10) {
                itemsInCart++;
                setState(() {});
              }
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
              size: 28.sp,
            ),
          ),
        ],
      ),
    );
  }
}
