import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}