// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/chips/choice_chip.dart';
import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/product.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                children: product!.colors!
                    .map(
                      (item) => TChoiceChip(
                        text: item!.color!.value ?? '',
                        selected: true,
                        onSelected: (value) {},
                      ),
                    )
                    .toList())
          ],
        ),

        ///--checkout button
      ],
    );
  }
}
