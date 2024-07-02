import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  var subCategoryController = Get.put(SubcategoryController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        SubcategoryController();
      },
      child: Scaffold(
          backgroundColor: const Color(0xfff7f7f7),
          extendBody: true,
          body: Obx(() {
            if (subCategoryController.isLoading.value) {
              return const Center(child: Text('Loading....'));
            }
            return SafeArea(
              child: Text("Category Page"),
            );
          })),
    );
  }
}
