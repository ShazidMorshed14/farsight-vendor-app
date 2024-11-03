import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:farsight_vendor_app/widgets/footer.dart';

class Screen extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  const Screen(
      {super.key,
      required this.body,
      this.appBar,
      this.bottomNavBar,
      this.floatingActionButton,
      this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      extendBody: true,
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavBar,
    );
  }
}


//Color(0xfff7f7f7)