import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/service/dio_module.dart';
import 'package:farsight_vendor_app/service/request.dart';

Future<Map<String, dynamic>?> placeMyOrder(
    {required double total_bill,
    required double total_discounted_bill,
    required String contact_no,
    required String delivery_address,
    String? payment_method,
    required List<CartItem> ordered_products}) async {
  List<Map<String, dynamic>> orderedProductsJson =
      ordered_products.map((item) => item.toJson()).toList();

  Map<String, dynamic> body = {
    "total_bill": total_bill ?? 0.0,
    "total_discounted_bill": total_discounted_bill ?? 0.0,
    "contact_no": contact_no,
    "delivery_address": delivery_address,
    "payment_method": payment_method ?? 'COD',
    "ordered_products": orderedProductsJson
  };

  print('req body--->${body}');

  try {
    final dioModule = DioModule();
    final response = await dioModule.dio.post(
      '/vendor/order',
      data: body,
    );
    var data = response.data;

    return data;
  } catch (e) {
    print('error printing here--->${e.toString()}');
    return null;
  }
}

Future<List<Order>?> fetchOrders() async {
  var response = await getRequest(uri: '/vendor/order');

  print('order list response-->$response');

  if (response?['status'] == 200) {
    var data = response?['data']; // List of orders
    if (data == null) {
      return null;
    }

    return (data as List)
        .map((orderJson) => Order.fromJson(orderJson))
        .toList();
  }
  return null;
}

Future<Order?> fetchOrderDetailsByOrderNo(String orderNo) async {
  var response = await getRequest(uri: '/vendor/order/$orderNo');

  print('order details response-->$response');

  if (response?['status'] == 200) {
    var data = response?['data'];
    if (data != null) {
      // Parse the data directly into an Outlet
      return Order.fromJson(data); // Ensure Outlet.fromJson exists
    }
  }
  return null; // If there's no valid data, return null
}
