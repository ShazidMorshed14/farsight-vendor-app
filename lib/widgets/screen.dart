import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farsight_vendor_app/widgets/footer.dart';

class Screen extends StatelessWidget {
  final Widget child;
  const Screen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      extendBody: true,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: 15,
                ),
                child: child,
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
