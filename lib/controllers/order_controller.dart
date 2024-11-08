import 'package:dio/dio.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/screens/home_screen.dart';
import 'package:farsight_vendor_app/service/order.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final _cartController = CartController.instance;

  var isLoading = true.obs;
  var isBtnLoading = false.obs;

  RxList<Order> ordersList = <Order>[].obs;

  // Delivery address controller and focus node
  final TextEditingController deliveryAddressController =
      TextEditingController();
  final FocusNode deliveryAddressFocusNode = FocusNode();
  final TextEditingController contactController = TextEditingController();
  final FocusNode contactFocusNode = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  final paymentMethodTitles = {
    'COD': 'Cash On Delivery',
    'ONLINE': 'Online Payment',
    'CARD': 'Credit/Debit Card',
  };

  var selectedPaymentMethod = 'COD'.obs; // Initially selected as 'COD'

  // Method to update payment method
  void updatePaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  Future<void> placeOrder(
      {required double total_bill,
      required double total_discounted_bill,
      required String contact_no,
      required String customer_name,
      required String delivery_address,
      String? payment_method,
      required List<CartItem> ordered_products}) async {
    try {
      isBtnLoading.toggle();
      print('calling api for order');
      final response = await placeMyOrder(
          total_bill: total_bill ?? 0.0,
          total_discounted_bill: total_discounted_bill ?? 0.0,
          contact_no: '+88${contact_no}',
          customer_name: customer_name,
          delivery_address: delivery_address,
          payment_method: payment_method ?? 'COD',
          ordered_products: ordered_products);
      print(response);
      if (response?["status"] == 200) {
        successNotif(message: 'Order placed successfully!', title: 'Success');
        _cartController.clearCart();
        Get.to(() => HomeScreen());
      } else {
        errorNotif(title: 'Order placed Failed', message: 'Failed');
      }
    } catch (e) {
      print(e);
    } finally {
      isBtnLoading.toggle();
    }
  }

  //fetch all orders
  Future<void> fetchAllOrders() async {
    try {
      isLoading(true);
      final fetchedOrders = await fetchOrders(); // Fetch list of orders
      print(fetchedOrders);
      ordersList.value =
          fetchedOrders ?? []; // Assign fetched list or an empty list
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // Autofocus the text field when the screen loads
  @override
  void onReady() {
    super.onReady();
    contactFocusNode.requestFocus(); // Focus the text field
  }

  @override
  void onClose() {
    // Dispose the TextEditingController and FocusNode when the controller is closed
    deliveryAddressController.clear(); // Clear the text field value
    deliveryAddressController.dispose();
    deliveryAddressFocusNode.dispose();
    contactController.clear(); // Clear the text field value
    contactController.dispose();
    contactFocusNode.dispose();
    nameController.clear(); // Clear the text field value
    nameController.dispose();
    nameFocusNode.dispose();
    super.onClose();
  }
}
