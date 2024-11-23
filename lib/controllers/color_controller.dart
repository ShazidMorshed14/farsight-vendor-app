import 'package:farsight_vendor_app/model/color.dart';
import 'package:farsight_vendor_app/service/brands.dart';
import 'package:farsight_vendor_app/service/colors.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  var isLoading = true.obs;
  var colorsList = <ColorModel>[].obs;

  Future<void> fetchColors() async {
    try {
      isLoading(true);
      var colorData = await fetchColorList();
      colorsList.assignAll(colorData);
    } catch (e) {
      print('Error fetching color data: $e');
    } finally {
      isLoading(false);
    }
  }
}
