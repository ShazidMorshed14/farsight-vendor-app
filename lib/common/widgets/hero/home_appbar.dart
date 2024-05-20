import 'package:farsight_vendor_app/common/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/common/widgets/products/cart_menu_icon.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

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
          Text("John Wick",
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
