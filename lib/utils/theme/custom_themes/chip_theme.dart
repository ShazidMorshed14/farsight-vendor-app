import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: TColors.grey.withOpacity(0.8),
      labelStyle: const TextStyle(color: Colors.black),
      //selectedColor: TColors.tprimary,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      checkmarkColor: Colors.white);
}
