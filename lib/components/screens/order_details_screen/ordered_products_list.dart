import 'package:farsight_vendor_app/components/global/cards/small_product_card.dart';
import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_item.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/order_details_controller.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/utils/global_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderedProductsList extends StatelessWidget {
  const OrderedProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = Get.find<OrderDetailsController>();

    final orderDetails = orderDetailsController.orderDetails.value;
    return Obx(() {
      if (orderDetails!.orderedProducts!.isEmpty) {
        return NoDataFound(
          assetLink: 'assets/animation/cart_bag_count.json',
          desc: 'No Item to order',
        );
      }

      return ListView.separated(
          shrinkWrap: true,
          itemCount: orderDetailsController
              .orderDetails.value!.orderedProducts!.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections / 2),
          itemBuilder: (_, index) {
            OrderedProduct item = orderDetails.orderedProducts![index];

            final productImage =
                item.productId?.productPictures?[0].img ?? 'default-img';

            final name = item.productId?.name ?? 'N/A';
            final brand = 'Nike';
            final color = item.variant?.name ?? 'N/A';

            final quantity = item.quantity ?? 0;
            final total_price = item.productTotalPrice ?? 0.0;
            final total_discounted_price = item.productDiscountedPrice ?? 0;

            return Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  SmallProductCard(
                      productImage: productImage,
                      name: name,
                      brand: brand,
                      color: color),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity: ${quantity}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Total: ${total_discounted_price} ${tk_sign}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${total_price} ${tk_sign}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
    });
  }
}
