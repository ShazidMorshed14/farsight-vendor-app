import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String content;
  final int color;
  final int? textColor;

  const CustomBadge({
    Key? key,
    required this.color,
    required this.content,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color:
              textColor != null ? Color(textColor!) : const Color(0xff171820),
        ),
      ),
    );
  }
}
