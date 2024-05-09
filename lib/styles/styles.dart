import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static InputDecoration customTextFieldStyle(
      {String labelTextStr = '',
      String hintTextStr = '',
      String? errorText,
      IconData? prefixIcon,
      suffix}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      labelText: labelTextStr,
      hintText: hintTextStr,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      suffixIcon: suffix,
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: primary,
            )
          : null,
      suffixIconColor: primary,
      errorText: errorText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary, width: 2.0),
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }

  static InputDecoration standardTextFieldStyle(
      {String labelTextStr = '',
      String hintTextStr = '',
      String? errorText,
      suffix}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12),
      labelText: labelTextStr,
      hintText: hintTextStr,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      suffixIcon: suffix,
      errorText: errorText,
    );
  }

  static ButtonStyle buttonStyle({double px = 12, double py = 14, int? color}) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Color(color ?? 0xff171820),
      padding: EdgeInsets.symmetric(
        horizontal: px,
        vertical: py,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static InputDecoration selectFieldStyle(
      {String labelStr = '', String hintTextStr = ''}) {
    return InputDecoration(
      hintText: hintTextStr,
      label: Text(labelStr),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary, width: 2.0),
        borderRadius: BorderRadius.circular(2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
    );
  }
}
