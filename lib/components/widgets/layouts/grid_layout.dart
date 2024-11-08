// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:farsight_vendor_app/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.crossAxisCount,
    this.mainAxisExtent,
    required this.itemBuilder,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  });

  final int itemCount;
  final int? crossAxisCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 10),
        //physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 2,
          mainAxisSpacing: mainAxisSpacing ?? TSizes.gridViewSpacing / 2,
          crossAxisSpacing: crossAxisSpacing ?? TSizes.gridViewSpacing / 2,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
