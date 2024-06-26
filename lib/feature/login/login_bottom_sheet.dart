import 'package:farsight_vendor_app/feature/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../foundation/sp_solid_button/sp_solid_button.dart';
import '../../foundation/theme/colors.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({super.key});

  var loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: AppColor.whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo-big.png",
                  height: 45,
                  width: 45,
                ),
                IconButton(
                    onPressed: () => {Get.back()},
                    icon: const Icon(
                      Icons.clear,
                      size: 30,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold)),
              TextSpan(text: "  "),
              TextSpan(
                  text: "or",
                  style: TextStyle(fontSize: 13, color: Colors.black)),
              TextSpan(text: "  "),
              TextSpan(
                  text: "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold))
            ])),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 43,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: AppColor.captionColor, fontSize: 13),
                controller: loginController.mobileEditingController,
                decoration: InputDecoration(
                    labelText: "Mobile Number*",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 12),
                      child: Text(
                        "+880 |",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColor.captionColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Colors.black54))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 43,
              child: TextField(
                style: TextStyle(color: AppColor.captionColor, fontSize: 13),
                controller: loginController.passwordEditingController,
                decoration: InputDecoration(
                    labelText: "Password*",
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                    prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10, top: 1),
                        child: Icon(Icons.remove_red_eye_rounded)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: AppColor.captionColor)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Colors.black54))),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "By continuing I agree to the",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  )),
              const TextSpan(text: "  "),
              TextSpan(
                  text: "Terms of Use",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.accentColor,
                      fontWeight: FontWeight.bold)),
              const TextSpan(
                  text: " & ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  )),
              TextSpan(
                  text: "Privacy & Policy",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColor.accentColor,
                      fontWeight: FontWeight.bold))
            ])),
            const SizedBox(height: 15),
            SPSolidButton(
              text: "Login",
              onPressed: loginController.login,
            ),
          ],
        ),
      ),
    );
  }
}
