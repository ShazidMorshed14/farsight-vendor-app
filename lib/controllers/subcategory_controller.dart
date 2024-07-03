import 'package:farsight_vendor_app/model/subcategory.dart';
import 'package:farsight_vendor_app/service/subcategory.dart';
import 'package:get/get.dart';

class SubcategoryController extends GetxController {
  var isLoading = true.obs;
  var subCategoryList = <SubCategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSubCategories();
  }

  Future<void> fetchSubCategories() async {
    try {
      isLoading(true);
      var subCategoryData = await fetchSubCategoryList();
      print('some data:$subCategoryData');
      subCategoryList.assignAll(subCategoryData);
    } catch (e) {
      print('Error fetching categories data: $e');
    } finally {
      isLoading(false);
    }
  }
}
