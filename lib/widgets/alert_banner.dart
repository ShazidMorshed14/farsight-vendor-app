import 'package:flutter/material.dart';
import 'package:farsight_vendor_app/constants/colors.dart';

class AlertBanner extends StatelessWidget {
  final double width;
  final String message;
  final String variant;

  AlertBanner({
    Key? key,
    required this.width,
    required this.message,
    required this.variant,
  }) : super(key: key);

  final Map<String, Color> backgroundColors = {
    'success': green,
    'error': red,
    'info': primary,
    'warning': orange,
  };

  final Map<String, IconData> bannerIcons = {
    'success': Icons.done_all,
    'info': Icons.info_outline,
    'error': Icons.error_outline,
    'warning': Icons.warning_amber_outlined
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColors[variant] ?? primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            color: Colors.white,
            bannerIcons[variant] ?? Icons.info_outline,
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: width - 100,
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
