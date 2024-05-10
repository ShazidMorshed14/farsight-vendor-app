import 'dart:convert';
import 'dart:developer';
import 'package:farsight_vendor_app/service/dio_module.dart';

Future<Map<String, dynamic>?> getRequest({
  required String uri,
  Map<String, dynamic>? query,
}) async {
  try {
    final dio = DioModule();

    final response = await dio.dio.get(
      uri,
      queryParameters: query,
    );
    var data = response.data;
    var dataJson = jsonDecode(jsonEncode(data));

    return dataJson;
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<Map<String, dynamic>?> postRequest({
  required String uri,
  Map<String, dynamic>? body,
}) async {
  try {
    final dioModule = DioModule();
    final response = await dioModule.dio.post(
      uri,
      data: body,
    );
    var data = response.data;
    print(data);
    var dataJson = jsonDecode(jsonEncode(data));

    return dataJson;
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<Map<String, dynamic>?> patchRequest({
  required String uri,
  Map<String, dynamic>? body,
}) async {
  try {
    final dio = DioModule();
    final response = await dio.dio.patch(
      uri,
      data: body,
    );
    var data = response.data;
    var dataJson = jsonDecode(jsonEncode(data));

    return dataJson;
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<Map<String, dynamic>?> deleteRequest({
  required String uri,
  Map<String, dynamic>? query,
}) async {
  try {
    final dio = DioModule();
    final response = await dio.dio.delete(
      uri,
      queryParameters: query,
    );
    var data = response.data;
    var dataJson = jsonDecode(jsonEncode(data));

    return dataJson;
  } catch (e) {
    log(e.toString());
    return null;
  }
}
