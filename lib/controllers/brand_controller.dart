import 'package:farsight_vendor_app/model/brand.dart';
import 'package:farsight_vendor_app/service/brands.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  var isLoading = true.obs;
  var brandsList = <BrandModel>[].obs;

  Future<void> fetchBrands() async {
    try {
      isLoading(true);
      var brandData = await fetchBrandList();
      brandsList.assignAll(brandData);
    } catch (e) {
      print('Error fetching brand data: $e');
    } finally {
      isLoading(false);
    }
  }
}
