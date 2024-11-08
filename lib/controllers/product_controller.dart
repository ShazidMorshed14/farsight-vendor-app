import 'package:farsight_vendor_app/model/product.dart';
import 'package:farsight_vendor_app/service/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  var isLoading = true.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading(true);

      //fetch product
      final fetchedFeaturedProducts = await fetchFeaturedProductsList();
      print('products $fetchedFeaturedProducts');

      //assign products
      featuredProducts.assignAll(fetchedFeaturedProducts);
    } catch (e) {
      print('Error fetching products data: $e');
    } finally {
      isLoading(false);
    }
  }

  ///-->Calculate Discount Percentage
  String? calculatePercentage(dynamic price, dynamic discount_amount) {
    if (discount_amount == null || discount_amount <= 0) {
      return null;
    }

    if (price! <= 0) return null;

    double salePrice = price - discount_amount;
    double percentage = ((price - salePrice) / price) * 100;
    return percentage.toStringAsFixed(0);
  }

  ///->Check product Status
  String getProductStockStatus(int quantity) {
    return quantity > 0 ? 'In Stock' : 'Out of Stock';
  }
}
