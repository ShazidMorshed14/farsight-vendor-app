import 'package:farsight_vendor_app/components/global/no_data_found.dart';
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
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/screens/checkout_screen.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final _cartController = CartController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.primaryBackground,
        appBar: TAppBar(
            showBackArrow: true,
            title: Text(
              'Cart',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    _cartController.clearCart();
                  },
                  icon: const Icon(Icons.delete_forever))
            ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Obx(() => ElevatedButton(
              onPressed: () {
                if (_cartController.cartItems.length > 0) {
                  Get.to(() => CheckoutScreen());
                } else {
                  errorNotif(message: 'Please add items to cart');
                }
              },
              child: Text('Checkout ${_cartController!.subtotal ?? 0} BDT'))),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Obx(() {
              if (_cartController.cartItems.isEmpty) {
                return NoDataFound(
                  assetLink: 'assets/animation/cart_bag_count.json',
                  desc: 'Cart is Empty',
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: _cartController.cartItems.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: TSizes.spaceBtwSections),
                    itemBuilder: (_, index) {
                      CartItem item = _cartController.cartItems[index];
                      double productTotal = item.product_discounted_price;
                      return Column(
                        children: [
                          TCardItem(cartItem: item),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                //add or minus quantity section
                                TProductQuantityControl(
                                  cartItem: item,
                                ),
                              ]),

                              //showing product price
                              TProductPriceText(
                                  price:
                                      item.product_discounted_price.toString()),
                              TProductPriceText(
                                price: item.product_total_price.toString(),
                                lineThrough: true,
                              ),
                              IconButton(
                                  onPressed: () {
                                    _cartController.removeItem(item!.productId);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          )
                        ],
                      );
                    });
              }
            })));
  }
}
