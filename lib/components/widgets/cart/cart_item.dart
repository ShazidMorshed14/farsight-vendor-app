import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCardItem extends StatelessWidget {
  const TCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///images
        TRoundedImage(
          imageUrl: TImages.product1,
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(TSizes.sm),
        ),

        ///title,price and color
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TProductTitleText(
                  title: 'Rayban Sunglasses | Classic Rayban Green Shade',
                  maxLines: 1,
                ),
              ),
              TBrandItemWithVerifiedIcon(
                title: 'Rayban',
              ),

              //attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
