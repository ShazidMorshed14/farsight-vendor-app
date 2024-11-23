import 'package:farsight_vendor_app/components/screens/shop/category_small_round_btn.dart';
import 'package:farsight_vendor_app/components/skeleton/skeleton_box.dart';
import 'package:farsight_vendor_app/components/widgets/chips/choice_chip.dart';
import 'package:farsight_vendor_app/components/widgets/layouts/grid_layout.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/brand_controller.dart';
import 'package:farsight_vendor_app/controllers/color_controller.dart';
import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final SubcategoryController subCategoryController =
      Get.put(SubcategoryController());

  final BrandController brandController = Get.put(BrandController());
  final ColorController colorController = Get.put(ColorController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      subCategoryController.fetchSubCategories();
      brandController.fetchBrands();
      colorController.fetchColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h),
            Text(
              'Filter Options',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Availability',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                CategorySmallRoundButton(
                  child: Center(
                      child: Text('All', style: TextStyle(fontSize: 12.sp))),
                  onPressed: () {},
                ),
                CategorySmallRoundButton(
                  child: Text('In Stock', style: TextStyle(fontSize: 12.sp)),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Sub-Categories',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Container(
              child: Obx(() {
                if (subCategoryController.isLoading.value) {
                  return TGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 35.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: TSizes.gridViewSpacing.w,
                    mainAxisSpacing: TSizes.gridViewSpacing.w,
                    itemBuilder: (_, index) {
                      return SkeletonBox();
                    },
                  );
                } else {
                  if (subCategoryController.subCategoryList.isEmpty) {
                    return Container();
                  } else {
                    return TGridLayout(
                      itemCount: subCategoryController.subCategoryList.length,
                      mainAxisExtent: 35.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: TSizes.gridViewSpacing.w,
                      mainAxisSpacing: TSizes.gridViewSpacing.w,
                      itemBuilder: (_, index) {
                        final item =
                            subCategoryController.subCategoryList[index];

                        return CategorySmallRoundButton(
                          child: Center(
                            child: Text('${item.name ?? 'N/A'}',
                                style: TextStyle(fontSize: 12.sp)),
                          ),
                          onPressed: () {},
                        );
                      },
                    );
                  }
                }
              }),
            ),
            SizedBox(height: 5.h),
            SizedBox(height: 10.h),
            Text(
              'Brands',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Container(
              child: Obx(() {
                if (brandController.isLoading.value) {
                  return TGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 35.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: TSizes.gridViewSpacing.w,
                    mainAxisSpacing: TSizes.gridViewSpacing.w,
                    itemBuilder: (_, index) {
                      return SkeletonBox();
                    },
                  );
                } else {
                  if (brandController.brandsList.isEmpty) {
                    return Container();
                  } else {
                    return TGridLayout(
                      itemCount: brandController.brandsList.length,
                      mainAxisExtent: 35.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: TSizes.gridViewSpacing.w,
                      mainAxisSpacing: TSizes.gridViewSpacing.w,
                      itemBuilder: (_, index) {
                        final item = brandController.brandsList[index];

                        return CategorySmallRoundButton(
                          child: Center(
                            child: Text('${item.name ?? 'N/A'}',
                                style: TextStyle(fontSize: 12.sp)),
                          ),
                          onPressed: () {},
                        );
                      },
                    );
                  }
                }
              }),
            ),
            SizedBox(height: 10.h),
            Text(
              'Colors',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Container(
              child: Obx(() {
                if (colorController.isLoading.value) {
                  return TGridLayout(
                    itemCount: 4,
                    mainAxisExtent: 35.h,
                    crossAxisCount: 4,
                    crossAxisSpacing: TSizes.gridViewSpacing.w,
                    mainAxisSpacing: TSizes.gridViewSpacing.w,
                    itemBuilder: (_, index) {
                      return SkeletonBox();
                    },
                  );
                } else {
                  if (colorController.colorsList.isEmpty) {
                    return Container();
                  } else {
                    return TGridLayout(
                      itemCount: colorController.colorsList.length,
                      mainAxisExtent: 35.h,
                      crossAxisCount: 4,
                      crossAxisSpacing: TSizes.gridViewSpacing.w,
                      mainAxisSpacing: TSizes.gridViewSpacing.w,
                      itemBuilder: (_, index) {
                        final item = colorController.colorsList[index];

                        return TChoiceChip(
                          text: item.value ?? '',
                          selected: false,
                          onSelected: (value) {},
                        );
                      },
                    );
                  }
                }
              }),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 20.h),
            Button(
              title: 'Apply Filter',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
