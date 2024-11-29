import 'package:farsight_vendor_app/model/category.dart';
import 'package:farsight_vendor_app/service/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categoryData = await fetchCategoryList();
      print('some data:$categoryData');
      categoryList.assignAll(categoryData);
    } catch (e) {
      print('Error fetching categories data: $e');
    } finally {
      isLoading(false);
    }
  }
}
