import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SPPasswordFormField extends StatelessWidget {
  const SPPasswordFormField(
      {super.key,
      required this.labelText,
      this.validator,
      this.textEditingController});
  final String labelText;

  final String? Function(String? value)? validator;

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      child: TextFormField(
        style: TextStyle(color: AppColor.captionColor, fontSize: 13),
        validator: validator,
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
          prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 10, top: 1),
              child: Icon(Icons.remove_red_eye_rounded)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.captionColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.black54)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red)),
        ),
      ),
    );
  }
}
