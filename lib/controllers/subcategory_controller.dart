import 'package:farsight_vendor_app/model/subcategory.dart';
import 'package:farsight_vendor_app/service/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SubcategoryController extends GetxController {
  var isLoading = true.obs;

  var subCategoryList = <SubCategoryModel>[].obs;

  fetchSubCategories() async {
    try {
      isLoading(true);

      var subCategoryData = await fetchSubCategoryList();

      subCategoryList.addAll(subCategoryData);
    } catch (e) {
      print('error fetching categories data $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchSubCategories();

    super.onInit();
  }
}
