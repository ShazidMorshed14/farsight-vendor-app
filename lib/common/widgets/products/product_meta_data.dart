import 'package:farsight_vendor_app/common/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/common/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/common/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              price: '500',
              isLarge: true,
            )
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///title
        TProductTitleText(title: 'Rayban Sunglasse'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
      ],
    );
  }
}
