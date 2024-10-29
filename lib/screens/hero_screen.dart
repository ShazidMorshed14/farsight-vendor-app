// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farsight_vendor_app/components/widgets/hero/home_categories.dart';
import 'package:farsight_vendor_app/components/widgets/hero/promo_slider.dart';
import 'package:farsight_vendor_app/components/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/layouts/grid_layout.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_card_vertical.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/product_controller.dart';
import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/containers/circular_container.dart';
import 'package:farsight_vendor_app/components/widgets/containers/primary_header_container.dart';
import 'package:farsight_vendor_app/components/widgets/containers/search_container.dart';
import 'package:farsight_vendor_app/components/widgets/curved_edges/curved_edges.dart';
import 'package:farsight_vendor_app/components/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/components/widgets/hero/home_appbar.dart';
import 'package:farsight_vendor_app/components/widgets/products/cart_menu_icon.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/screens/settings_screen.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:farsight_vendor_app/widgets/screen.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  Map<String, dynamic> user = {};

  final GetStorage authStorage = GetStorage('authStorage');
  bool bannersLoading = false;

  @override
  void initState() {
    super.initState();
    preloadData();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;

    // final ProductController productController = Get.put(ProductController());
    final SubcategoryController subcategoryController =
        Get.put(SubcategoryController());
    final ProductController productController = Get.put(ProductController());
    final _cartController = Get.put(CartController());

    return RefreshIndicator(
      onRefresh: () async {
        preloadData();
      },
      child: Scaffold(
        backgroundColor: TColors.primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //header part
              TPrimaryHeaderContainer(
                  child: Column(
                children: [
                  ///hero section header
                  THomeAppBar(user: user),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///searchbar
                  TSearchContainer(
                    width: width,
                    text: "Search in store...",
                    icon: Icons.search,
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///categories
                  TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: Colors.white),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  //categories
                  THomeCategories()
                ],
              )),

              //image carousal section
              Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //---promo sider section
                    TPromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3,
                        TImages.promoBanner4
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),

                    TSectionHeading(
                        title: 'Popular Products',
                        showActionButton: true,
                        onPressed: () {},
                        textColor: Colors.black,
                        leftPadding: TSizes.xs),

                    const SizedBox(height: TSizes.spaceBtwItems),

                    //---product grid view section
                    Obx(() {
                      if (productController.isLoading.value) {
                        return SizedBox(
                            height: 80,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: TColors.tprimary,
                            )));
                      }

                      if (productController.featuredProducts.isEmpty) {
                        return Center(child: Text('No Data Found'));
                      }

                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TGridLayout(
                          itemCount: productController.featuredProducts.length,
                          mainAxisExtent: height * 0.315,
                          crossAxisCount: 2,
                          crossAxisSpacing: TSizes.gridViewSpacing,
                          mainAxisSpacing: TSizes.gridViewSpacing,
                          itemBuilder: (_, index) {
                            final product =
                                productController.featuredProducts[index];

                            final isInCart = _cartController.cartItems
                                .any((item) => item.productId == product.id);
                            final inCartIndex = _cartController.cartItems
                                .indexWhere(
                                    (item) => item.productId == product.id);

                            int totalAddedQty = 0;
                            if (inCartIndex != -1) {
                              CartItem foundItem =
                                  _cartController.cartItems[inCartIndex];
                              totalAddedQty = foundItem?.quantity ?? 0;
                            }
                            return TProductCardVertical(
                                product: product,
                                isInCart: isInCart,
                                totalAddedQty: totalAddedQty);
                          },
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  preloadData() async {
    print('Refreshing preload...');

    setState(() {
      bannersLoading = false;
    });
    print('bannersLoading-->$bannersLoading');

    var userData = await authStorage.read('user');
    print('userFromHero$userData');
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }

    await Get.put(SubcategoryController()).fetchSubCategories();
    await Get.put(ProductController()).fetchFeaturedProducts();

    // var res = await fetchShiftInfo();

    // if (res != null) {
    //   if (mounted) {
    //     setState(() {
    //       shiftData = res;
    //       loadingShift = false;
    //     });
    //   }

    // } else {
    //   if (mounted) {
    //     setState(() {
    //       shiftData = null;
    //       loadingShift = false;
    //     });
    //   }
    // }
  }
}
