import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../foundation/profile_item/profile_item.dart';
import '../../foundation/sp_solid_button/sp_solid_button.dart';
import '../../foundation/theme/colors.dart';
import '../login/login_bottom_sheet.dart';
import 'profile_footer_content.dart';

class ProfileWithoutLogin extends StatelessWidget {
  const ProfileWithoutLogin({super.key});

  final double topContainerHeight = 190;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: topContainerHeight,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: topContainerHeight * .58,
                      color: AppColor.dummyBGColor,
                    ),
                    Container(
                      height: topContainerHeight * .42,
                      color: AppColor.whiteColor,
                    )
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    height: 132,
                    width: 132,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(25),
                        child: Image.asset(
                          "assets/images/user.png",
                          color: AppColor.bodyTextColor1,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 22,
                    left: 165,
                    child: SPSolidButton(
                        text: "Log in/Sign up",
                        widthPercent: .4,
                        onPressed: () => {Get.bottomSheet(LoginBottomSheet())}))
              ],
            )),
        const SizedBox(height: 18),
        Container(
          color: AppColor.whiteColor,
          child: Column(
            children: [
              ProfileItem(
                title: 'Orders',
                assetname: "orders.png",
                subtitle: "Check you order status",
                onTap: () => {Get.bottomSheet(LoginBottomSheet())},
              ),
              ProfileItem(
                  title: 'Help Center',
                  assetname: "help-desk.png",
                  subtitle: "Help regarding your recent purchase"),
              ProfileItem(
                title: 'Wishlist',
                assetname: "heart.png",
                subtitle: "Your most loved styles",
                isLast: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          color: AppColor.whiteColor,
          child: const Column(
            children: [
              ProfileItem(
                title: "Scan for coupon",
                assetname: 'qr-code.png',
              ),
              ProfileItem(
                title: "Refer and earn",
                assetname: 'earnings.png',
                isLast: true,
              )
            ],
          ),
        ),
        const SizedBox(height: 18),
        FooterContent(),
        const SizedBox(
          height: 30,
        ),
        Text(
          "APP VERSION 0.0.1",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
