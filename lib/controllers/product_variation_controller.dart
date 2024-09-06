import 'package:farsight_vendor_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductVariatonController extends GetxController {
  static ProductVariatonController get instance => Get.find();

  final productStock = 0.obs;
  final productPrice = 0.0.obs;
  final addedAmount = 0.0.obs;
  final discountPercentage = 0.obs;
  final originalPrice = 0.0.obs;

  // Store the selected variant
  Rxn<ColorElement> selectedVariant = Rxn<ColorElement>();

  late ProductModel product;

  @override
  void onInit() {
    super.onInit();
  }

  /// Initialize product values (called when navigating to the page)
  void initializeProductValues(ProductModel product) {
    this.product = product;
    productStock.value = product.quantity ?? 0;
    productPrice.value = (product.price?.toDouble() ?? 0) -
        (product.discountAmount?.toDouble() ?? 0);
    originalPrice.value = product.price?.toDouble() ?? 0.0;
    if (product.discountAmount!.toDouble() > 0.0) {
      double originalPrice = product.price?.toDouble() ?? 0.0;
      double discountedPrice = (product.price?.toDouble() ?? 0) -
          (product.discountAmount?.toDouble() ?? 0);
      double percentage =
          ((originalPrice - discountedPrice) / originalPrice) * 100;
      discountPercentage.value = percentage.toInt();
    }

    //if there is vairant then set first one as selected default
    if (product!.colors != null && product!.colors!.length > 0) {
      ColorElement variant = product!.colors![0];
      onAttributeSelected(product, variant);
    }
  }

  /// Select attribute and variation
  void onAttributeSelected(ProductModel product, ColorElement variant) {
    this.product = product;
    // Store the selected variant
    selectedVariant.value = variant;

    //update the quantity with the variant quantity
    productStock.value = variant?.colorQuantity ?? 0;
    if (variant.addAmount! > 0) {
      double currentProductPrice =
          product!.price!.toDouble() - product!.discountAmount!.toDouble();
      productPrice.value =
          (currentProductPrice + (variant.addAmount ?? 0.0)).toDouble();
    } else {
      productPrice.value = (product.price?.toDouble() ?? 0) -
          (product.discountAmount?.toDouble() ?? 0);
    }
    addedAmount.value = (variant.addAmount ?? 0.0).toDouble();
  }

  /// Reset selected attribute
  void resetSelectedAttribute() {
    final productStock = 0;
    final productPrice = 0.0;
    final addedAmount = 0.0;
    final discountPercentage = 0;
    final originalPrice = 0.0;
    selectedVariant.value = null; // Reset the selected variant
  }
}
