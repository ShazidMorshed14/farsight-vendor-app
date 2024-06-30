import 'package:carousel_slider/carousel_slider.dart';
import 'package:farsight_vendor_app/common/widgets/containers/circular_container.dart';
import 'package:farsight_vendor_app/common/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/feature/home_page/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    {controller.updatePageIndicator(index)}),
            items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? Colors.blue
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
