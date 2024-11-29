import 'package:farsight_vendor_app/components/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:farsight_vendor_app/controllers/subcategory_controller.dart';
import 'package:farsight_vendor_app/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class THomeCategories extends StatelessWidget {
  THomeCategories({
    super.key,
  });

  final SubcategoryController subCategoryController =
      Get.put(SubcategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (subCategoryController.isLoading.value) {
        return SizedBox(
            height: 80,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )));
      } else {
        if (subCategoryController.subCategoryList.length < 1) {
          return Container(
            child: Center(
              child: Text(
                'No Data Found',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: subCategoryController.subCategoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final subCategory =
                      subCategoryController.subCategoryList[index];
                  return TVerticalImageText(
                    image: subCategory!.subCategoryAppImage ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-nh_NQsthgTAQcsI1HwGvvQdox0QAl_OH0cowVz_cf1g8qPjuFQn6C-0jTvYP0Or-AJI&usqp=CAU',
                    title: subCategory!.name ?? 'N/A',
                    onTap: () {
                      Get.to(() => ShopScreen(
                            prefillSubCategory: subCategory.id,
                          ));
                    },
                    isNetworkImage: true,
                  );
                }),
          );
        }
      }
    });
  }
}
