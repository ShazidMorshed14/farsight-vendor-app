import 'package:farsight_vendor_app/model/product.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<List<ProductModel>> fetchFeaturedProductsList() async {
  Map<String, dynamic> query = {};

  print('calling featured products...');

  var response = await getRequest(uri: '/product/featured', query: query);
  print(response?['data']?['products']);

  if (response?['status'] == 200) {
    var data = response?['data']?['products'];
    if (data == null) {
      return [];
    }
    return List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x)));
  }
  return [];
}
