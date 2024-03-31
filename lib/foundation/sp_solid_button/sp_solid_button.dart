import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SPSolidButton extends StatelessWidget {
  const SPSolidButton(
      {super.key, required this.text, this.widthPercent = 1, this.onPressed});

  final String text;
  final num? widthPercent;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )),
          backgroundColor: MaterialStateProperty.all(AppColor.accentColor)),
      child: Container(
          width: MediaQuery.of(context).size.width * widthPercent!,
          height: 45,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 12.5,
                fontWeight: FontWeight.w600),
          ))),
    );
  }
}
