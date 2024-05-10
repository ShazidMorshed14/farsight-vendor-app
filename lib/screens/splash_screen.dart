import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:farsight_vendor_app/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      extendBody: true,
      body: SafeArea(
        child: SizedBox(
          width: Get.size.width,
          height: Get.size.height,
          child: Container(
            color: Colors.white,
            child: SizedBox(
              width: Get.size.width,
              height: Get.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    env['appName'],
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0E2B63),
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: Get.size.height * 0.2,
                    child: Lottie.asset(
                      'assets/animation/glass.json',
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.size.width * 0.8,
                    child: const Text(
                      'Your best place for eye wear!',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0E2B63),
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Powered by Shazid Morshed',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
