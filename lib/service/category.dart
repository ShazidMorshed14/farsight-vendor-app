import 'package:farsight_vendor_app/model/category.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<List<CategoryModel>> fetchCategoryList() async {
  var response = await getRequest(uri: '/category');
  print(response);

  if (response?['status'] == 200) {
    var data = response?['data'];
    if (data == null) {
      return [];
    }
    return List<CategoryModel>.from(data.map((x) => CategoryModel.fromJson(x)));
  }
  return [];
}
