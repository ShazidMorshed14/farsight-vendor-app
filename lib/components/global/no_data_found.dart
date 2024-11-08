// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:farsight_vendor_app/constants/colors.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    Key? key,
    this.assetLink,
    this.desc,
    this.shortDesc,
    this.textColor,
  }) : super(key: key);

  final String? assetLink;
  final String? desc;
  final String? shortDesc;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        height: Get.size.height * 0.7,
        // decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.size.height * 0.2,
                child: Lottie.asset(
                  assetLink ?? 'assets/animation/empty_box.json',
                ),
              ),
              Text(
                desc ?? 'No Data Found',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor ?? TColors.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
