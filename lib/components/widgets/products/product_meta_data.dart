// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/components/widgets/texts/product_meta_tag_text.dart';
import 'package:farsight_vendor_app/controllers/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/product.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salesPercentage = 25;
    final productTitle = product.name ?? 'N/A';
    final sku = product.sku ?? 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price
        Row(
          children: [
            //sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.tsecondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.black)),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            //price
            Text(
              '250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(
              price: 500,
              isLarge: true,
            )
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///title
        TProductTitleText(title: productTitle ?? 'Rayban Sunglasse'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //sku
        Row(
          children: [
            ProductMetaTagSmallText(title: 'SKU:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            ProductMetaTagSmallText(title: sku),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            ProductMetaTagSmallText(title: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            ProductMetaTagSmallText(title: 'In Stock'),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
      ],
    );
  }
}
