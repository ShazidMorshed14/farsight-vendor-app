import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_item.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_qty_control_btns.dart';
import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_price_text.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/image_strings.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.primaryBackground,
        appBar: TAppBar(
            showBackArrow: true,
            title: Text(
              'Cart',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child:
              ElevatedButton(onPressed: () {}, child: Text('Checkout 250 BDT')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: TSizes.spaceBtwSections),
              itemBuilder: (_, index) => Column(
                    children: [
                      TCardItem(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            //extra space
                            const SizedBox(width: 65),

                            //add or minus quantity section
                            TProductQuantityControl(),
                          ]),

                          //showing product price
                          TProductPriceText(price: 250),
                        ],
                      )
                    ],
                  )),
        ));
  }
}
