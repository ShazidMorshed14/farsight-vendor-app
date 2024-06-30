import 'package:farsight_vendor_app/common/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:farsight_vendor_app/common/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/common/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/common/widgets/products/product_details_image_slider.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: '5.0',
                                style: Theme.of(context).textTheme.bodyLarge),
                            const TextSpan(text: '(199)')
                          ])),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share, size: TSizes.iconMd))
                    ],
                  )
                  //------Price Title Stock and Brand
                  //------Attributes
                  //------Checkout Button
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
