import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_attributes.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_details_image_slider.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_meta_data.dart';
import 'package:farsight_vendor_app/components/widgets/products/rating_share_widget.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          onPressed: () {}, child: Text('Checkout')))
                  //------Description
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
