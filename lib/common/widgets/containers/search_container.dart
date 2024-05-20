import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer(
      {super.key,
      required this.width,
      this.icon,
      this.showBackground = true,
      this.showBorder = true,
      required this.text});

  final double width;
  final IconData? icon;
  final bool showBackground, showBorder;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: showBackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            border: showBorder ? Border.all(color: Colors.white) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
