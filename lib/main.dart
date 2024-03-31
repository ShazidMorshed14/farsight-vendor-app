import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'feature/landing_page/landing_page.dart';
import 'foundation/theme/colors.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    const Duration(seconds: 5),
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Farsight",
      theme: ThemeData(
          textTheme: TextTheme(
              titleSmall: TextStyle(
                fontSize: 14.5,
                letterSpacing: 0.15,
                color: AppColor.titleSmall,
              ),
              bodyMedium:
                  TextStyle(fontSize: 14, color: AppColor.bodyTextColor1),
              bodySmall:
                  TextStyle(fontSize: 11, color: AppColor.captionColor))),
      home: LandingPage(),
    );
  }
}
