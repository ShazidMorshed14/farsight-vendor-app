// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/controllers/auth_controller.dart';
import 'package:farsight_vendor_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/products/cart_menu_icon.dart';
import 'package:farsight_vendor_app/model/user.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Day for Shopping!",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: const Color.fromARGB(255, 247, 245, 245))),
          Obx(() => Text(authController.user.value?.name ?? 'Unknown',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white))),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {
            Get.to(() => CartScreen());
          },
          iconColor: Colors.white,
        )
      ],
    );
  }
}
