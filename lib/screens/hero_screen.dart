// ignore_for_file: public_member_api_docs, sort_constructors_first
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
                  THomeAppBar(),

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
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return TVerticalImageText(
                            image: 'assets/icons/globe.png',
                            title: 'Shoes',
                            onTap: () {},
                          );
                        }),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  preloadData() async {
    // setState(() {
    //   shiftData = null;
    //   loadingShift = true;
    // });

    var userData = await authStorage.read('user');
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

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: TColors.dark,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
