// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/components/widgets/icons/t_circular_icon.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';

class TProductQuantityControl extends StatefulWidget {
  final CartItem cartItem;

  const TProductQuantityControl({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<TProductQuantityControl> createState() =>
      _TProductQuantityControlState();
}

class _TProductQuantityControlState extends State<TProductQuantityControl> {
  @override
  Widget build(BuildContext context) {
    final _cartController = CartController.instance;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //--->add / remove btns
        GestureDetector(
          onTap: () {
            _cartController.decrementCartItemQuantity(widget.cartItem);
          },
          child: TCircularIcon(
            icon: Icons.remove,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),

        //--->quantity
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(
          '${widget.cartItem.quantity}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        GestureDetector(
          onTap: () {
            _cartController.incrementCartItemQuantity(widget.cartItem);
          },
          child: TCircularIcon(
            icon: Icons.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: Colors.white,
            backgroundColor: TColors.tprimary,
          ),
        ),
      ],
    );
  }
}
