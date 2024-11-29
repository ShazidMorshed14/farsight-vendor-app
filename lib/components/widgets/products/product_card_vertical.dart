// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/utils/global_utils.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
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
    this.isInCart = false,
    this.totalAddedQty = 1,
  }) : super(key: key);

  final ProductModel product;
  final bool? isInCart;
  final int? totalAddedQty;

  @override
  Widget build(BuildContext context) {
    final height = Get.size.height;
    final width = Get.size.width;

    final _cartController = Get.find<CartController>();

    //attributes
    String? thumbnailImage = product!.productPictures!.isNotEmpty
        ? product.productPictures![0].img
        : 'https://png.pngtree.com/png-vector/20221125/ourmid/pngtree-no-image-available-icon-flatvector-illustration-picture-coming-creative-vector-png-image_40968940.jpg';
    String productTitle = product.name;
    double productPrice = product.price.toDouble() ?? 0.0;
    String? brand = product?.brand?.name != null ? product?.brand?.name : 'N/A';

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product)),
      child: Container(
        //width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: Colors.white),
        child: Stack(
          children: [
            Column(
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
                      // Positioned(
                      //   top: 0,
                      //   child: TRoundedContainer(
                      //     backgroundColor: TColors.tsecondary.withOpacity(0.8),
                      //     radius: TSizes.sm,
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: TSizes.sm, vertical: TSizes.xs),
                      //     child: Text(
                      //       '25%',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelLarge!
                      //           .apply(color: Colors.black),
                      //     ),
                      //   ),
                      // ),

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
                      SizedBox(
                        height: 34,
                        child: TProductTitleText(
                          title: productTitle ?? 'N/A',
                          smallSize: true,
                        ),
                      ),

                      const SizedBox(height: TSizes.spaceBtwItems / 2),

                      TBrandItemWithVerifiedIcon(title: brand),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //price
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TProductPriceText(
                        price: formatCurrencyToTwoDecimal(
                            product.price.toDouble() ?? 0.0)),
                  ),

                  //add to cart icon
                  Row(
                    children: [
                      Visibility(
                        visible: product.quantity != null &&
                            product.quantity > 0 &&
                            isInCart == false,
                        child: GestureDetector(
                          onTap: () =>
                              Get.to(() => ProductDetails(product: product)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: TColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusSm),
                                bottomRight:
                                    Radius.circular(TSizes.cardRadiusSm),
                              ),
                            ),
                            child: SizedBox(
                              width: TSizes.iconLg,
                              height: TSizes.iconLg,
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      //already added cart icon
                      Visibility(
                        visible: isInCart == true,
                        child: GestureDetector(
                          onTap: () =>
                              Get.to(() => ProductDetails(product: product)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: TColors.tprimary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusSm),
                                bottomRight:
                                    Radius.circular(TSizes.cardRadiusSm),
                              ),
                            ),
                            child: SizedBox(
                              width: TSizes.iconLg,
                              height: TSizes.iconLg,
                              child: Center(
                                  child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: TSizes.iconSm,
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
