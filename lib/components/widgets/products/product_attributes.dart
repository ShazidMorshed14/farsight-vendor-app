import 'package:farsight_vendor_app/components/widgets/chips/choice_chip.dart';
import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///-Selected attribute Pricing and Description
        TRoundedContainer(
          backgroundColor: TColors.lightGrey,
          radius: TSizes.cardRadiusSm,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  children: [
                    TSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                      textColor: Colors.black,
                      leftPadding: 0,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //actual price
                        const TProductTitleText(
                          title: 'price: ',
                          smallSize: true,
                        ),
                        Text(
                          '1000 ৳',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),

                        const SizedBox(width: TSizes.spaceBtwItems),

                        const TProductPriceText(price: 500)
                      ],
                    ),
                    Row(
                      children: [
                        const TProductTitleText(
                            title: 'Stock : ', smallSize: true),
                        const TProductTitleText(
                            title: 'In Stock ', smallSize: true),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems),

                /// variation description
                const TProductTitleText(
                  title:
                      'This is the description of the Product and it can go up to max 4 lines.',
                  smallSize: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        ///-color attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Colors',
              textColor: Colors.black,
              leftPadding: 0,
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),

        ///--checkout button
      ],
    );
  }
}
