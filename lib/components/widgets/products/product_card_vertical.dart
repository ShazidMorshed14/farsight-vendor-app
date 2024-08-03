// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/shadows.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/product.dart';
import 'package:farsight_vendor_app/screens/product_details.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final height = Get.size.height;
    final width = Get.size.width;

    //attributes
    String? thumbnailImage = product!.productPictures!.isNotEmpty
        ? product.productPictures![0].img
        : 'https://png.pngtree.com/png-vector/20221125/ourmid/pngtree-no-image-available-icon-flatvector-illustration-picture-coming-creative-vector-png-image_40968940.jpg';
    String productTitle = product.name;
    int productPrice = product.price;
    String? brand = product?.brand?.name != null ? product?.brand?.name : 'N/A';

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        //width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: Colors.white),
        child: Column(
          children: [
            //thumbnail
            TRoundedContainer(
              //padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                      height: height * 0.175,
                      width: width * 0.45,
                      isNetworkImage: true,
                      imageUrl: thumbnailImage!,
                      applyImageRadius: true),

                  //sale tag
                  Positioned(
                    top: 0,
                    child: TRoundedContainer(
                      backgroundColor: TColors.tsecondary.withOpacity(0.8),
                      radius: TSizes.sm,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),

                  //favourite Icon Button
                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: TCircularIcon(
                  //     icon: Icons.favorite,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            //details
            //Product Details
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //product title
                  TProductTitleText(
                    title: productTitle ?? 'N/A',
                    smallSize: true,
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  Row(
                    children: [
                      Text(
                        brand ?? 'rayban',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: TSizes.xs),
                      Icon(
                        Icons.verified_rounded,
                        color: TColors.tprimary,
                        size: TSizes.iconXs,
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      TProductPriceText(price: productPrice ?? 0),

                      //add to cart icon
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                            )),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
