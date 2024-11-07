// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';

class SmallProductCard extends StatelessWidget {
  const SmallProductCard({
    Key? key,
    required this.productImage,
    required this.name,
    required this.brand,
    required this.color,
  }) : super(key: key);

  final String productImage;
  final String name;
  final String brand;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: productImage,
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(TSizes.sm),
          isNetworkImage: true,
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 2),

        ///title,price and color
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TProductTitleText(
                  title: name,
                  maxLines: 1,
                  smallSize: true,
                ),
              ),
              TBrandItemWithVerifiedIcon(
                title: brand,
              ),

              //attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Color: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: color,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
