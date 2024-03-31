import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../foundation/profile_item/profile_item.dart';
import '../../foundation/theme/colors.dart';
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
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.accentColor)),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 45,
                        child: Center(
                            child: Text(
                          "Log in/Sign up",
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                )
              ],
            )),
        const SizedBox(height: 18),
        Container(
          color: AppColor.whiteColor,
          child: const Column(
            children: [
              ProfileItem(
                  title: 'Orders',
                  assetname: "orders.png",
                  subtitle: "Check you order status"),
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
