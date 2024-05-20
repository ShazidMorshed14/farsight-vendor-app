import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading(
      {super.key,
      this.onPressed,
      this.textColor = Colors.white,
      this.buttonTitle = 'View all',
      required this.title,
      this.showActionButton = false});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Popular Categories',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showActionButton)
                TextButton(onPressed: onPressed, child: Text('view all'))
            ],
          )
        ],
      ),
    );
  }
}
