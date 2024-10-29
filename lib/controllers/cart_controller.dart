import 'dart:convert';

import 'package:farsight_vendor_app/controllers/product_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  final productController = Get.put(ProductController());

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

  void incrementCartItemQuantity(CartItem item) {
    int existingIndex =
        cartItems.indexWhere((element) => element.productId == item.productId);

    if (existingIndex >= 0) {
      CartItem selectedCartItem = cartItems[existingIndex];
      int newQuantity = selectedCartItem.quantity + 1;
      final totalPrice = selectedCartItem.product_unit_price * newQuantity;
      final totalDiscountedPrice = (selectedCartItem.product_unit_price -
              selectedCartItem.product_discount) *
          newQuantity;

      if (newQuantity <= item.stock) {
        // Increment the quantity if the item exists
        selectedCartItem.quantity += 1;
        selectedCartItem.product_total_price = totalPrice;
        selectedCartItem.product_discounted_price = totalDiscountedPrice;

        saveCart(); // Save the updated cart
      } else {
        errorNotif(message: 'Quantity not available!');
      }
    } else {
      errorNotif(message: 'Item not found in the cart');
    }
  }

  void decrementCartItemQuantity(CartItem item) {
    int existingIndex =
        cartItems.indexWhere((element) => element.productId == item.productId);
    if (existingIndex >= 0) {
      // Decrement the quantity if the item exists and quantity > 1
      if (cartItems[existingIndex].quantity > 1) {
        CartItem selectedCartItem = cartItems[existingIndex];
        int newQuantity = selectedCartItem.quantity - 1;
        final totalPrice = selectedCartItem.product_unit_price * newQuantity;
        final totalDiscountedPrice = (selectedCartItem.product_unit_price -
                selectedCartItem.product_discount) *
            newQuantity;

        selectedCartItem.quantity -= 1;
        selectedCartItem.product_total_price = totalPrice;
        selectedCartItem.product_discounted_price = totalDiscountedPrice;
        saveCart(); // Save the updated cart
      } else {
        // Optionally, remove the item from the cart if the quantity is 1
        removeItem(item.productId);
        successNotif(message: 'Item removed from cart');
      }
    } else {
      errorNotif(message: 'Item not found in the cart');
    }
  }

  // Add an item to the cart
  void addItem(CartItem item) {
    int existingIndex = cartItems.indexWhere((element) =>
        element.productId == item.productId && element.variant == item.variant);
    if (existingIndex >= 0) {
      CartItem selectedCartItem = cartItems[existingIndex];
      int newQuantity = selectedCartItem.quantity + item.quantity;
      final totalPrice = selectedCartItem.product_unit_price * newQuantity;
      final totalDiscountedPrice = (selectedCartItem.product_unit_price -
              selectedCartItem.product_discount) *
          newQuantity;
      if (newQuantity <= item.stock) {
        selectedCartItem.quantity = newQuantity;
        selectedCartItem.product_total_price = totalPrice;
        selectedCartItem.product_discounted_price = totalDiscountedPrice;
        successNotif(message: 'Added to Cart Successfully!');
      } else {
        errorNotif(message: 'Quantity not available!');
      }
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
    productController.isLoading(true);
    List<Map<String, dynamic>> cartList =
        cartItems.map((e) => e.toMap()).toList();
    box.write('cart', jsonEncode(cartList));
    cartItems.refresh();
    productController.isLoading(false);
  }

  // Clear the cart
  void clearCart() {
    cartItems.clear();
    box.remove('cart');
    productController.isLoading(true);
    productController.isLoading(false);
    errorNotif(message: 'Cart Cleared!');
  }

  // Get the total number of items in the cart
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Calculate the total
  double get get_total_bill => cartItems.fold(
      0, (sum, item) => sum + (item.product_unit_price * item.quantity));

  // Calculate the discount
  double get get_total_discount => cartItems.fold(
      0, (sum, item) => sum + (item.product_discount * item.quantity));

  // Calculate the subtotal
  double get subtotal => cartItems.fold(
      0, (sum, item) => sum + (item.product_discounted_price * item.quantity));
}
