import 'package:flutter/material.dart';
import '../../foundation/theme/colors.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      body: const Scaffold(
        body: Center(
          child: Text("Categories Page"),
        ),
      ),
    );
  }
}
