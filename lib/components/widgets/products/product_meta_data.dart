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
import 'package:get/get.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salesPercentage =
        controller.calculatePercentage(product.price, product.discountAmount);
    final productTitle = product.name ?? 'N/A';
    final sku = product.sku ?? 'N/A';
    final price = product.price ?? 0;
    final discountedPrice =
        (product.price!.toDouble()) - (product.discountAmount!.toDouble());
    final stockStatus =
        controller.getProductStockStatus(product!.quantity ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price
        Row(
          children: [
            //discounted price
            TProductPriceText(
              price: discountedPrice.toInt(),
              isLarge: true,
            ),

            Visibility(
                visible: salesPercentage != null,
                child: const SizedBox(width: TSizes.spaceBtwItems / 2)),

            //price
            Visibility(
              visible: salesPercentage != null,
              child: Text(
                price.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            ),

            Visibility(
                visible: salesPercentage != null,
                child: const SizedBox(width: TSizes.spaceBtwItems / 2)),

            //sale tag
            Visibility(
              visible: salesPercentage != null,
              child: TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.tsecondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('$salesPercentage%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.black)),
              ),
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///title
        TProductTitleText(title: productTitle ?? 'Rayban Sunglasse'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //sku
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductMetaTagSmallText(title: 'SKU:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            SizedBox(
              width: Get.size.width * 0.7,
              child: ProductMetaTagSmallText(
                title: sku,
                maxLines: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///stock status
        Row(
          children: [
            ProductMetaTagSmallText(title: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            ProductMetaTagSmallText(title: stockStatus),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        Row(
          children: [
            ProductMetaTagSmallText(title: 'Stock:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            ProductMetaTagSmallText(
                title: product!.quantity != null
                    ? product!.quantity!.toString()
                    : '0'),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
      ],
    );
  }
}
