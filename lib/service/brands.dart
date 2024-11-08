import 'package:farsight_vendor_app/model/brand.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<List<BrandModel>> fetchBrandList() async {
  var response = await getRequest(uri: '/brand');
  print(response);

  if (response?['status'] == 200) {
    var data = response?['data'];
    if (data == null) {
      return [];
    }
    return List<BrandModel>.from(data.map((x) => BrandModel.fromJson(x)));
  }
  return [];
}
