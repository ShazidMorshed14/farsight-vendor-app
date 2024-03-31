import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SPSolidButton extends StatelessWidget {
  const SPSolidButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )),
          backgroundColor: MaterialStateProperty.all(AppColor.accentColor)),
      child: Container(
          width: MediaQuery.of(context).size.width,
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
