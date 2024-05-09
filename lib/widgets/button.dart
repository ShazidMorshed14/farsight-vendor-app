import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

const double baseSize = 4;

class Button extends StatefulWidget {
  const Button({
    this.isDisabled = false,
    required this.title,
    this.color,
    this.size,
    this.textColor,
    this.width,
    required this.onPressed,
    this.icon,
    super.key,
    this.isLoading = false,
  });

  final String title;
  final Color? color;
  final Color? textColor;
  final Callback onPressed;
  final double? width;
  final String? size;
  final bool isDisabled;
  final IconData? icon;
  final bool isLoading;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  double getFontSize() {
    switch (widget.size) {
      case 'small':
        return 14;
      case 'large':
        return 18;
      default:
        return 16;
    }
  }

  double getHeight() {
    if (widget.size == 'small') {
      return baseSize * 3;
    } else if (widget.size == 'large') {
      return baseSize * 6;
    } else {
      return baseSize * 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasIcon = widget.icon != null ? true : false;

    return Material(
      color: widget.isDisabled || widget.isLoading
          ? Colors.grey[500]
          : widget.color ?? const Color(0xff5567f7),
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: widget.isDisabled || widget.isLoading ? null : widget.onPressed,
        child: Container(
          width: widget.width ?? 250,
          padding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: getHeight(),
          ),
          child: Row(
            mainAxisAlignment: hasIcon
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 4,
                      ),
                    )
                  : Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: getFontSize(),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: Colors.white,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
