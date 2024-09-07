// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';

class TCardItem extends StatelessWidget {
  const TCardItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///images
        TRoundedImage(
          imageUrl: cartItem.productImage ?? '',
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
                  title: cartItem!.name ?? '',
                  maxLines: 1,
                ),
              ),
              TBrandItemWithVerifiedIcon(
                title: cartItem!.brand ?? '',
              ),

              //attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Color: ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                TextSpan(
                  text: cartItem!.color ?? 'N/A',
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
