// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farsight_vendor_app/common/widgets/hero/home_categories.dart';
import 'package:farsight_vendor_app/common/widgets/hero/promo_slider.dart';
import 'package:farsight_vendor_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:farsight_vendor_app/common/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/common/widgets/layouts/grid_layout.dart';
import 'package:farsight_vendor_app/common/widgets/products/product_card_vertical.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:farsight_vendor_app/common/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/common/widgets/containers/circular_container.dart';
import 'package:farsight_vendor_app/common/widgets/containers/primary_header_container.dart';
import 'package:farsight_vendor_app/common/widgets/containers/search_container.dart';
import 'package:farsight_vendor_app/common/widgets/curved_edges/curved_edges.dart';
import 'package:farsight_vendor_app/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/common/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/common/widgets/hero/home_appbar.dart';
import 'package:farsight_vendor_app/common/widgets/products/cart_menu_icon.dart';
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
                  ),
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
                    TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => TProductCardVertical())
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
