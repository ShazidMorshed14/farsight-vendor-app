// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBrandItemWithVerifiedIcon extends StatelessWidget {
  const TBrandItemWithVerifiedIcon({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title ?? 'N/A',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Icons.verified_rounded,
          color: TColors.tprimary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
