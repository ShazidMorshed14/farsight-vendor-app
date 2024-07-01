// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:farsight_vendor_app/common/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/common/widgets/products/cart_menu_icon.dart';
import 'package:farsight_vendor_app/model/user.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Day for Shopping!",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: const Color.fromARGB(255, 247, 245, 245))),
          Text(user['name'] ?? 'Unknown',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white)),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: Colors.white,
        )
      ],
    );
  }
}
