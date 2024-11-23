import 'package:farsight_vendor_app/model/color.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<List<ColorModel>> fetchColorList() async {
  var response = await getRequest(uri: '/color');
  print(response);

  if (response?['status'] == 200) {
    var data = response?['data'];
    if (data == null) {
      return [];
    }
    return List<ColorModel>.from(data.map((x) => ColorModel.fromJson(x)));
  }
  return [];
}
