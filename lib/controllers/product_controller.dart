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

      //assign products
      featuredProducts.assignAll(fetchedFeaturedProducts);
    } catch (e) {
      print('Error fetching products data: $e');
    } finally {
      isLoading(false);
    }
  }
}
