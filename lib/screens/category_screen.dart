import 'package:farsight_vendor_app/components/widgets/images/t_rounded_image.dart';
import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final SubcategoryController subCategoryController =
      Get.put(SubcategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: subCategoryController.fetchSubCategories,
        child: Obx(() {
          if (subCategoryController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (subCategoryController.subCategoryList.length < 1) {
              return const Card(
                child: Center(
                  child: Text('No Data Found'),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: subCategoryController.subCategoryList.length,
                itemBuilder: (context, index) {
                  final subCategory =
                      subCategoryController.subCategoryList[index];
                  return Container(
                    child: Card(
                      child: Row(
                        children: [
                          Text(subCategory!.name ?? 'N/A'),
                          TRoundedImage(
                              width: 50,
                              height: 50,
                              isNetworkImage: true,
                              imageUrl: subCategory!.subCategoryAppImage ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-nh_NQsthgTAQcsI1HwGvvQdox0QAl_OH0cowVz_cf1g8qPjuFQn6C-0jTvYP0Or-AJI&usqp=CAU')
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        }),
      ),
    );
  }
}
