// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/product_variation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/bottom_add_to_cart.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_attributes.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_details_image_slider.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_meta_data.dart';
import 'package:farsight_vendor_app/components/widgets/products/rating_share_widget.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/product.dart';

import 'package:flutter_html/flutter_html.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  final ProductVariatonController productVariationController =
      Get.put(ProductVariatonController());

  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    productVariationController.initializeProductValues(product);

    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //--product image slider
            TProductImageSlider(
              product: product,
            ),

            //--product details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///---Rating & Share Button
                  TRatingAndShare(),
                  //------Price Title Stock and Brand
                  TProductMetaData(product: product),

                  //------Attributes
                  TProductAttributes(
                    product: product,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //------Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child:
                          Obx(() => productVariationController.productStock > 0
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(TSizes.md),
                                    backgroundColor: Colors.black,
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: Text('Checkout'))
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(TSizes.md),
                                    backgroundColor: Colors.black,
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                  onPressed: () {},
                                  child: Text('Out of Stock')))),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  //------Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                    leftPadding: 0,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  Center(
                      child: Html(
                    data: product.description ?? "",
                  )),

                  //--bottom navigation bar
                  const Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
