import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySmallRoundButton extends StatelessWidget {
  const CategorySmallRoundButton({
    super.key,
    required this.child,
    this.borderRadius = 10.0,
    this.borderColor = Colors.grey,
    this.iconColor,
    this.onPressed,
    this.backgroundColor,
    this.height,
  });

  final Widget child;
  final double? borderRadius;
  final Color? borderColor;
  final Color? iconColor;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 35.h,
        margin: const EdgeInsets.only(right: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: backgroundColor ?? Colors.transparent,
            border: backgroundColor != null
                ? Border.all(width: 0.0)
                : Border.all(color: borderColor!)),
        child: child,
      ),
    );
  }
}
