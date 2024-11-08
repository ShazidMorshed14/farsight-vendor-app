import 'dart:async';
import 'package:farsight_vendor_app/model/brand.dart';
import 'package:farsight_vendor_app/model/category.dart';
import 'package:farsight_vendor_app/model/product.dart';
import 'package:farsight_vendor_app/model/product.dart';
import 'package:farsight_vendor_app/model/subcategory.dart';
import 'package:farsight_vendor_app/service/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  static ShopController get instance => Get.find();

  //variables
  RxList<ProductModel> productsList = <ProductModel>[].obs;
  RxList<CategoryModel> categorylist = <CategoryModel>[].obs;
  RxList<SubCategoryModel> subcategorylist = <SubCategoryModel>[].obs;
  RxList<BrandModel> brandList = <BrandModel>[].obs;

  //loaders
  var isLoading = false.obs;
  var isBrandsLoading = false.obs;
  var isCategoriesLoading = false.obs;
  var isSubCategoriesLoading = false.obs;

  //filters
  var selectedBrand = 'All'.obs;
  var selectedCategory = 'All'.obs;
  var selectedSubCategory = 'All'.obs;

  //debounced search
  TextEditingController searchController = TextEditingController();
  Timer? debounceTimer;

  //others
  var isSearchVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    //fetchBrands();
    //fetchCategories();
    fetchAllProducts();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    print('on search change calling.....');
    if (debounceTimer?.isActive ?? false) debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      fetchAllProducts();
    });
  }

  // Fetches products based on search query, selected brand, and category
  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      String searchQuery = searchController.text.trim();

      // Build query parameters
      final queryParameters = {
        if (searchQuery.isNotEmpty) 'search': searchQuery,
        if (selectedBrand.value != 'All') 'brand': selectedBrand.value,
        if (selectedCategory.value != 'All') 'category': selectedCategory.value,
        'pageLess': true
      };

      final fetchedProducts = await fetchProductsForShop(queryParameters);
      productsList.assignAll(fetchedProducts);
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
