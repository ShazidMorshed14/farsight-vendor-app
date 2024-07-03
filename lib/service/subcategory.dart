import 'package:farsight_vendor_app/model/subcategory.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<List<SubCategoryModel>> fetchSubCategoryList() async {
  Map<String, dynamic> query = {};

  print('calling subcategories...');

  var response = await getRequest(uri: '/subcategory', query: query);
  print(response);

  if (response?['status'] == 200) {
    var data = response?['data'];
    if (data == null) {
      return [];
    }
    return List<SubCategoryModel>.from(
        data.map((x) => SubCategoryModel.fromJson(x)));
  }
  return [];
}
