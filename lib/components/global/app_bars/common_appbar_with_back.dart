// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/utils/routing.dart';

class TAppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  TAppBarWithBack({
    Key? key,
    this.title,
    this.isCenter = true,
    this.showBack = true,
    this.backToHome = false,
  }) : super(key: key);

  final String? title;
  final bool? isCenter;
  final bool? showBack;
  final bool? backToHome;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      title: title != null ? Text(title!) : null,
      centerTitle: isCenter ?? true,
      leadingWidth: 80.w,
      leading: showBack!
          ? IconButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: TSizes.iconSm,
              ))
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
