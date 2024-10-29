import 'package:farsight_vendor_app/components/global/app_bars/custom_appbar_with_multi_actions.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/screens/cart_screen.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.lightGrey,
      appBar: CustomAppBarwithMultipleActions(
        title: 'Product',
        leftIcon: Icons.arrow_back_ios_new,
        onLeftIconPressed: () {
          Get.back();
        },
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.search, color: TColors.tIconPrimary),
              onPressed: () {
                // productsController.isSearchVisible.toggle();
              }),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Badge(
              label: Obx(() => Text(
                    _cartController.totalItems.toString(),
                  )),
              smallSize: 1,
              backgroundColor: Colors.red,
              offset: const Offset(-5, 5),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: TColors.tIconPrimary),
                onPressed: () {
                  navigator!.push(
                    createPageRoute(
                      CartScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
