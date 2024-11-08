// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/components/widgets/texts/product_meta_tag_text.dart';
import 'package:farsight_vendor_app/controllers/product_controller.dart';
import 'package:farsight_vendor_app/controllers/product_variation_controller.dart';
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
    final variationController = ProductVariatonController.instance;
    final salesPercentage =
        controller.calculatePercentage(product.price, product.discountAmount);
    final productTitle = product.name ?? 'N/A';
    final sku = product.sku ?? 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///price
        Obx(
          () => Row(
            children: [
              //discounted price
              TProductPriceText(
                price: variationController.productPrice.toDouble().toString(),
                isLarge: true,
              ),

              Visibility(
                  visible: variationController.discountPercentage != null &&
                      variationController.discountPercentage > 0,
                  child: const SizedBox(width: TSizes.spaceBtwItems / 2)),

              //price
              Visibility(
                visible: variationController.discountPercentage != null &&
                    variationController.discountPercentage > 0,
                child: Text(
                  variationController!.originalPrice!.toString() ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough),
                ),
              ),

              Visibility(
                  visible: variationController!.discountPercentage != null &&
                      variationController!.discountPercentage > 0,
                  child: const SizedBox(width: TSizes.spaceBtwItems / 2)),

              //sale tag
              Visibility(
                visible: variationController!.discountPercentage != null &&
                    variationController!.discountPercentage > 0,
                child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.tsecondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text('${variationController.discountPercentage ?? 0}%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),

        //added amount for variant
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Obx(() => Visibility(
              visible: variationController.addedAmount > 0.0,
              child: Row(
                children: [
                  ProductMetaTagSmallText(
                    title: 'Added amount for variant:',
                    textColor: TColors.tprimary,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems / 2),
                  ProductMetaTagSmallText(
                    title: '+${variationController.addedAmount.toString()} ৳',
                    textColor: TColors.tprimary,
                  ),
                ],
              ),
            )),

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
            Obx(
              () => ProductMetaTagSmallText(
                title: controller.getProductStockStatus(
                    variationController.productStock.toInt() ?? 0),
                textColor: variationController.productStock.toInt() <= 0
                    ? Colors.red
                    : Colors.green,
              ),
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        Row(
          children: [
            ProductMetaTagSmallText(title: 'Stock:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Obx(
              () => ProductMetaTagSmallText(
                  title: variationController.productStock != null
                      ? variationController.productStock!.toString()
                      : '0'),
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///Brand
      ],
    );
  }
}
