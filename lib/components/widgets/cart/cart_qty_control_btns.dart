import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductQuantityControl extends StatefulWidget {
  const TProductQuantityControl({super.key});

  @override
  State<TProductQuantityControl> createState() =>
      _TProductQuantityControlState();
}

class _TProductQuantityControlState extends State<TProductQuantityControl> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //--->add / remove btns
        TCircularIcon(
          icon: Icons.remove,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: Colors.black,
          backgroundColor: Colors.white,
        ),

        //--->quantity
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        TCircularIcon(
          icon: Icons.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: Colors.white,
          backgroundColor: TColors.tprimary,
        ),
      ],
    );
  }
}
