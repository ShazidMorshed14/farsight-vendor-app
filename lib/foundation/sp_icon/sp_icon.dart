import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:flutter/material.dart';

class SPIcon extends StatelessWidget {
  const SPIcon({super.key, required this.assetname, this.isSelected = false});

  final String assetname;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$assetname",
      height: 25,
      width: 25,
      color: isSelected! ? TColors.tprimary : Colors.black,
    );
  }
}
