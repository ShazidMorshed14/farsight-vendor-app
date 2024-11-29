// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:farsight_vendor_app/components/screens/shop/category_small_round_btn.dart';
import 'package:farsight_vendor_app/components/skeleton/skeleton_box.dart';
import 'package:farsight_vendor_app/components/widgets/chips/choice_chip.dart';
import 'package:farsight_vendor_app/components/widgets/layouts/grid_layout.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/brand_controller.dart';
import 'package:farsight_vendor_app/controllers/color_controller.dart';
import 'package:farsight_vendor_app/controllers/shop_controller.dart';
import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:farsight_vendor_app/widgets/button.dart';

class FilterDrawer extends StatefulWidget {
  final void Function()? closeDrawer;
  FilterDrawer({
    Key? key,
    this.closeDrawer,
  }) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final SubcategoryController subCategoryController =
      Get.put(SubcategoryController());

  final CategoryController categoryController = Get.put(CategoryController());
  final BrandController brandController = Get.put(BrandController());
  final ColorController colorController = Get.put(ColorController());
  final shopController = Get.find<ShopController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      subCategoryController.fetchSubCategories();
      categoryController.fetchCategories();
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
              'Categories',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Container(
              child: Obx(() {
                if (categoryController.isLoading.value) {
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
                  if (categoryController.categoryList.isEmpty) {
                    return Container();
                  } else {
                    return TGridLayout(
                      itemCount: categoryController.categoryList.length,
                      mainAxisExtent: 35.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: TSizes.gridViewSpacing.w,
                      mainAxisSpacing: TSizes.gridViewSpacing.w,
                      itemBuilder: (_, index) {
                        final item = categoryController.categoryList[index];

                        return Obx(() => CategorySmallRoundButton(
                              child: Center(
                                child: Text('${item.name ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: shopController
                                                  .selectedCategory.value ==
                                              item.id!
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                              ),
                              onPressed: () {
                                if (item.id != null) {
                                  if (shopController.selectedCategory.value ==
                                      item.id!) {
                                    shopController.selectedCategory.value =
                                        'All';
                                  } else {
                                    shopController.selectedCategory.value =
                                        item.id!;
                                  }
                                }
                              },
                              backgroundColor:
                                  shopController.selectedCategory.value ==
                                          item.id.toString()
                                      ? Colors.black
                                      : Colors.transparent,
                            ));
                      },
                    );
                  }
                }
              }),
            ),
            SizedBox(height: 5.h),
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

                        return Obx(() => CategorySmallRoundButton(
                              child: Center(
                                child: Text('${item.name ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: shopController
                                                  .selectedSubCategory.value ==
                                              item.id!
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                              ),
                              onPressed: () {
                                if (item.id != null) {
                                  if (shopController
                                          .selectedSubCategory.value ==
                                      item.id!) {
                                    shopController.selectedSubCategory.value =
                                        'All';
                                  } else {
                                    shopController.selectedSubCategory.value =
                                        item.id!;
                                  }
                                }
                              },
                              backgroundColor:
                                  shopController.selectedSubCategory.value ==
                                          item.id.toString()
                                      ? Colors.black
                                      : Colors.transparent,
                            ));
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

                        return Obx(() => CategorySmallRoundButton(
                              child: Center(
                                child: Text('${item.name ?? 'N/A'}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color:
                                          shopController.selectedBrand.value ==
                                                  item.id!
                                              ? Colors.white
                                              : Colors.black,
                                    )),
                              ),
                              onPressed: () {
                                if (item.id != null) {
                                  if (shopController.selectedBrand.value ==
                                      item.id!) {
                                    shopController.selectedBrand.value = 'All';
                                  } else {
                                    shopController.selectedBrand.value =
                                        item.id!;
                                  }
                                }
                              },
                              backgroundColor:
                                  shopController.selectedBrand.value ==
                                          item.id.toString()
                                      ? Colors.black
                                      : Colors.transparent,
                            ));
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

                        return Obx(() => TChoiceChip(
                              text: item.value ?? '',
                              selected:
                                  shopController.selectedColor.value == item.id!
                                      ? true
                                      : false,
                              onSelected: (value) {
                                if (item.id != null) {
                                  if (shopController.selectedColor.value ==
                                      item.id!) {
                                    shopController.selectedColor.value = 'All';
                                  } else {
                                    shopController.selectedColor.value =
                                        item.id!;
                                  }
                                }
                              },
                            ));
                      },
                    );
                  }
                }
              }),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  width: 120,
                  size: 'small',
                  title: 'Reset',
                  onPressed: () {
                    shopController.resetAllFilters();
                    shopController.applyFilters();
                    widget.closeDrawer!();
                  },
                  color: Colors.grey,
                ),
                Button(
                  width: 120,
                  size: 'small',
                  title: 'Apply Filter',
                  onPressed: () {
                    shopController.applyFilters();
                    widget.closeDrawer!();
                  },
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
