import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: Get.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: Get.size.width * 0.2,
              height: 15,
              color: const Color(0xff0e2b63),
            ),
            Container(
              width: Get.size.width * 0.18,
              height: 15,
              color: const Color(0xff004f9f),
            ),
            Container(
              width: Get.size.width * 0.12,
              height: 15,
              color: const Color(0xff00b1eb),
            ),
            Container(
              width: Get.size.width * 0.1,
              height: 15,
              color: const Color(0xffef7d00),
            ),
            Container(
              width: Get.size.width * 0.08,
              height: 15,
              color: const Color(0xffffbb00),
            ),
            Container(
              width: Get.size.width * 0.08,
              height: 15,
              color: const Color(0xff50af47),
            ),
            Container(
              width: Get.size.width * 0.08,
              height: 15,
              color: const Color(0xffafca0b),
            ),
            Container(
              width: Get.size.width * 0.08,
              height: 15,
              color: const Color(0xff5a328a),
            ),
            Container(
              width: Get.size.width * 0.08,
              height: 15,
              color: const Color(0xffe72582),
            ),
          ],
        ),
      ),
    );
  }
}
