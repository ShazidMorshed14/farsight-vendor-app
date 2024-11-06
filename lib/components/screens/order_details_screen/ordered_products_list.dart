import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_item.dart';
import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/components/widgets/products/brand_title_with_verified.dart';
import 'package:farsight_vendor_app/components/widgets/texts/product_title_text.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/order_details_controller.dart';
import 'package:farsight_vendor_app/model/order.dart';
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
              const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (_, index) {
            OrderedProduct item = orderDetails.orderedProducts![index];
            return Text(
              '${item.productId!.name}',
              style: TextStyle(fontSize: 15),
            );
          });
    });
  }
}
