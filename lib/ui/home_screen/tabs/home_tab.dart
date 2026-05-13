import 'package:e_commerce/ui/home_screen/tabs/product_list/cubit/product_list_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/di.dart';
import '../../utils/custom_search-bar.dart';
import '../../utils/my_assets.dart';
import '../../utils/my_colors.dart';
import '../widgets/annountcements_section.dart';
import '../widgets/categories_section.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_veiw_model.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => HomeTabVeiwModel(
            getAllCategoriesUsecase: injectGetAllCategoriesUsecase(),
            getAllBrandsUsecase: injectGetAllBrandsUsecase(),
          )..getCategories()..getAllBrands(),
      child: BlocConsumer<HomeTabVeiwModel, HomeTabState>(
        listener: (context, state) {
          // 👂 Listen for snackbars or navigation
        },
        builder: (context, state) {
          final cubit = context.read<HomeTabVeiwModel>();

          // UI Logic remains the same...
          if (state is HomeTabCategoryLoadingState && cubit.categoriesList == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeTabCategoryErrorState) {
            return Center(child: Text(state.errorMassage ?? "An error occurred"));
          }

          if (cubit.categoriesList != null || cubit.BrandsList != null) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),

                child: CustomScrollView(
                  cacheExtent: 1500,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Image.asset(MyAssets.logo, color: MyColors.primaryColor),
                          SizedBox(height: 18.h),
                          const CustomSearchWithShoppingCart(),
                          SizedBox(height: 16.h),
                          AnnouncementsSection(),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CategoriesOrBrandsSection(list: cubit.categoriesList ?? []),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                    SliverToBoxAdapter(
                      child: CategoriesOrBrandsSection(list: cubit.BrandsList ?? []),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
