import 'package:farsight_vendor_app/common/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/common/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/common/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/shadows.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: Colors.white),
      child: Column(
        children: [
          //thumbnail
          TRoundedContainer(
            height: 180,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: TColors.light,
            child: Stack(
              children: [
                TRoundedImage(
                  imageUrl: TImages.product2,
                  applyImageRadius: true,
                ),

                //sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    backgroundColor: TColors.tsecondary.withOpacity(0.8),
                    radius: TSizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),

                //favourite Icon Button
                TCircularIcon()
              ],
            ),
          )
          //details
        ],
      ),
    );
  }
}
