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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //--product image slider
            TProductImageSlider(),

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
                  TProductMetaData(),

                  //------Attributes
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //------Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Checkout'))),
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
                  ReadMoreText(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more..',
                    trimExpandedText: 'Show less..',
                    moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue),
                    lessStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue),
                  ),

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
