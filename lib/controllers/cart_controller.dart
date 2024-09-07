import 'dart:convert';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final box = GetStorage();
  var cartItems = <CartItem>[].obs; // Observable list for live updates

  final selectQuantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadCart(); // Load cart when the controller is initialized
  }

  // Load cart items from GetStorage
  void loadCart() {
    String? cartJson = box.read('cart');
    if (cartJson != null) {
      List<dynamic> cartList = jsonDecode(cartJson);
      cartItems.value = cartList.map((item) => CartItem.fromMap(item)).toList();
    }
  }

  void incrementCartSelectQuantity(int productQuantity) {
    if (selectQuantity.value < productQuantity) {
      selectQuantity.value = selectQuantity.value + 1;
    }
  }

  void decrementCartSelectQuantity() {
    if (selectQuantity.value > 1) {
      selectQuantity.value = selectQuantity.value - 1;
    }
  }

  // Add an item to the cart
  void addItem(CartItem item) {
    int existingIndex =
        cartItems.indexWhere((element) => element.productId == item.productId);
    if (existingIndex >= 0) {
      // If it exists, update the quantity
      cartItems[existingIndex] = CartItem(
          productId: item.productId,
          name: item.name,
          brand: item.brand ?? 'N/A',
          quantity: cartItems[existingIndex].quantity + item.quantity,
          price: item.price,
          discountAmount: item.discountAmount ?? 0.0,
          variantId: item.variantId,
          color: item.color ?? 'N/A');

      successNotif(message: 'Added to Cart Successfully!');
    } else {
      // If it doesn't exist, add the new item
      cartItems.add(item);
      successNotif(message: 'Added to Cart Successfully!');
    }

    saveCart();
  }

  // Remove an item from the cart
  void removeItem(String productId) {
    cartItems.removeWhere((item) => item.productId == productId);
    saveCart();
  }

  // Save the cart to GetStorage
  void saveCart() {
    List<Map<String, dynamic>> cartList =
        cartItems.map((e) => e.toMap()).toList();
    box.write('cart', jsonEncode(cartList));
  }

  // Clear the cart
  void clearCart() {
    cartItems.clear();
    box.remove('cart');
    errorNotif(message: 'Cart Cleared!');
  }

  // Get the total number of items in the cart
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Calculate the subtotal
  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
