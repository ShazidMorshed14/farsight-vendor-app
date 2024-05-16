import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const primary = Color(0xff0e2b63);
const darkBlue = Color(0xff0e2b63);
const lightBlue = Color(0xff00b1eb);
const green = Color(0xff3D8361);
const red = Color(0xffE94560);
const purple = Color(0xff5a328a);
const orange = Color(0xffef7d00);
const pink = Color(0xffe72582);
const bg = Color(0xfFE9EBEA);

class TColors {
  TColors._();

  //App Basic Colors
  static const Color tprimary = Color(0xFF4b68ff);
  static const Color tsecondary = Color(0xFFFFE24B);
  static const Color taccent = Color(0xFFb0c7ff);

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

  //Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  //Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);

  //Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xDD277E2C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
}
