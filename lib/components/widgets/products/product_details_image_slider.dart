// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:farsight_vendor_app/controllers/images_controller.dart';
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/product.dart';
import 'package:get/get.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    //image controlling controller
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.light,
        child: Stack(
          children: [
            //--main large Image
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final heroImage = controller.selectedProductImage.value;
                    return GestureDetector(
                        onTap: () => controller.showEnlargedImage(heroImage),
                        child: CachedNetworkImage(
                          imageUrl: heroImage,
                          progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: TColors.tprimary,
                          ),
                        ));
                  })),
                )),

            //image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                    itemBuilder: (_, index) => Obx(() {
                          final isImageSelected =
                              controller.selectedProductImage.value ==
                                  images[index];
                          return TRoundedImage(
                              onPressed: () => controller
                                  .selectedProductImage.value = images[index],
                              width: 70,
                              isNetworkImage: true,
                              backgroundColor: Colors.white,
                              border: isImageSelected
                                  ? Border.all(color: TColors.tprimary)
                                  : Border.all(color: Colors.white),
                              imageUrl: images[index]);
                        })),
              ),
            ),

            //---Appbar icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Icons.favorite, color: Colors.grey)
              ],
            )
          ],
        ),
      ),
    );
  }
}
