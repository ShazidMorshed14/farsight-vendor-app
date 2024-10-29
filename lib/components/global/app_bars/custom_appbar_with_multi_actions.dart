import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';

class CustomAppBarwithMultipleActions extends StatelessWidget
    implements PreferredSizeWidget {
  final IconData? leftIcon;
  final VoidCallback? onLeftIconPressed;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final List<Widget>? actions;
  final bool? centerTitle;

  const CustomAppBarwithMultipleActions(
      {super.key,
      this.leftIcon,
      this.onLeftIconPressed,
      this.title,
      this.titleStyle,
      this.subTitle,
      this.subTitleStyle,
      this.actions,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      elevation: 0,
      //leadingWidth: leftIcon != null ? 65 : 0,
      leadingWidth: 80,
      leading: leftIcon != null
          ? IconButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              icon: Icon(
                leftIcon,
                color: Colors.black,
                size: TSizes.iconSm,
              ),
              onPressed: onLeftIconPressed,
            )
          : null,
      title: title != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
              ],
            )
          : null,
      centerTitle: centerTitle ?? true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
