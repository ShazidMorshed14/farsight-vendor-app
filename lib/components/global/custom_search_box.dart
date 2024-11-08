// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({
    super.key,
    this.hintText,
    this.rightIcon,
    this.rightIconColor,
    this.onRightIconPressed,
    this.controller,
  });

  final String? hintText;
  final IconData? rightIcon;
  final Color? rightIconColor;
  final VoidCallback? onRightIconPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText ?? 'Search...',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              child: rightIcon != null
                  ? IconButton(
                      icon:
                          Icon(rightIcon, color: rightIconColor ?? Colors.red),
                      onPressed: onRightIconPressed,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
