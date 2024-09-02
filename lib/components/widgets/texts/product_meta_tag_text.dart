// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductMetaTagSmallText extends StatelessWidget {
  const ProductMetaTagSmallText({
    Key? key,
    required this.title,
    this.maxLines = 1,
  }) : super(key: key);

  final String title;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }
}
