// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/product_variation_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/model/product.dart';

class TBottomAddToCart extends StatelessWidget {
  TBottomAddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final _cartController = CartController.instance;
    final _productVariationController = ProductVariatonController.instance;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Icons.remove,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.white,
                onPressed: () {
                  _cartController.decrementCartSelectQuantity();
                },
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Obx(
                () => Text(
                  _cartController.selectQuantity.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              TCircularIcon(
                icon: Icons.add,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.white,
                onPressed: () {
                  _cartController.incrementCartSelectQuantity(
                      _productVariationController.productStock.toInt());
                },
              ),
            ],
          ),
          Obx(() {
            return _cartController.selectQuantity.value > 0
                ? ElevatedButton(
                    onPressed: () {
                      ColorElement? selectedVariant =
                          _productVariationController.selectedVariant.value;
                      if (selectedVariant == null) {
                        // Handle case where no variant is selected
                        return;
                      }
                      // Add item to cart
                      CartItem newItem = CartItem(
                          productId: product.id,
                          name: product.name,
                          brand: product.brand?.name ?? 'N/A',
                          color: selectedVariant!.color!.name ?? 'N/A',
                          quantity: _cartController.selectQuantity.value ?? 0,
                          price:
                              _productVariationController.productPrice.value ??
                                  0.0,
                          discountAmount: product!.discountAmount != null
                              ? product?.discountAmount?.toDouble()
                              : 0.0,
                          variantId: selectedVariant.id.toString() ?? 'N/A',
                          productImage: product?.productPictures![0]?.img !=
                                  null
                              ? product?.productPictures![0]?.img
                              : 'https://t4.ftcdn.net/jpg/02/07/87/79/360_F_207877921_BtG6ZKAVvtLyc5GWpBNEIlIxsffTtWkv.jpg');
                      _cartController.addItem(newItem);
                    },
                    child: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                    ))
                : ElevatedButton(
                    onPressed: () {},
                    child: const Text('Out of Stock'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                    ));
          })
        ],
      ),
    );
  }
}
