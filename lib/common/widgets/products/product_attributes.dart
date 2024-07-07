import 'package:farsight_vendor_app/common/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/common/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/common/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/common/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///-Selected attribute Pricing and Description
        TRoundedContainer(
          backgroundColor: TColors.grey,
          radius: TSizes.cardRadiusSm,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              children: [
                Row(
                  children: [
                    TSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems),
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
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),

                            const SizedBox(width: TSizes.spaceBtwItems),

                            const TProductPriceText(price: '500')
                          ],
                        ),
                        Row(
                          children: [
                            const TProductTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text('In Stock',
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        )
                      ],
                    )
                  ],
                ),

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
      ],
    );
  }
}
