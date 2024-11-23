import 'package:farsight_vendor_app/components/global/app_bars/custom_appbar_with_multi_actions.dart';
import 'package:farsight_vendor_app/components/global/custom_search_box.dart';
import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/screens/shop/category_small_round_btn.dart';
import 'package:farsight_vendor_app/components/skeleton/skeleton_box.dart';
import 'package:farsight_vendor_app/components/widgets/layouts/grid_layout.dart';
import 'package:farsight_vendor_app/components/widgets/products/filter_drawer.dart';
import 'package:farsight_vendor_app/components/widgets/products/product_card_vertical.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/shop_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/screens/cart_screen.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _cartController = Get.put(CartController());
  final productsController = Get.put(ShopController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _cartController.loadCart();
    productsController.fetchAllProducts();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<ShopController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: TColors.tlightbg,
        appBar: CustomAppBarwithMultipleActions(
          title: 'Product',
          leftIcon: Icons.filter_list_rounded,
          onLeftIconPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: TColors.tIconPrimary),
              onPressed: () {
                productsController.isSearchVisible.toggle();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Badge(
                label: Obx(() => Text(
                      _cartController.totalItems.toString(),
                    )),
                smallSize: 1,
                backgroundColor: Colors.red,
                offset: const Offset(-5, 5),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: TColors.tIconPrimary),
                  onPressed: () {
                    navigator!.push(
                      createPageRoute(
                        CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(width: 300.w, child: FilterDrawer()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),

              //search box
              Obx(() {
                return productsController.isSearchVisible.value
                    ? CustomSearchBox(
                        hintText: 'Search Products...',
                        controller: productsController.searchController,
                      )
                    : SizedBox
                        .shrink(); // Return an empty widget when search is not visible
              }),

              const SizedBox(
                height: 8,
              ),
              //products
              Expanded(
                child: Obx(() {
                  if (productsController.isLoading.value) {
                    return TGridLayout(
                      itemCount: 10,
                      mainAxisExtent: 260.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: TSizes.gridViewSpacing.w,
                      mainAxisSpacing: TSizes.gridViewSpacing.w,
                      itemBuilder: (_, index) {
                        return SkeletonBox();
                      },
                    );
                  } else {
                    if (productsController.productsList.isEmpty) {
                      return const NoDataFound();
                    } else {
                      return RefreshIndicator(
                        onRefresh: () async {
                          productsController.fetchAllProducts();
                        },
                        child: TGridLayout(
                          itemCount: productsController.productsList.length,
                          mainAxisExtent: 260.h,
                          crossAxisCount: 2,
                          crossAxisSpacing: TSizes.gridViewSpacing.w,
                          mainAxisSpacing: TSizes.gridViewSpacing.w,
                          itemBuilder: (_, index) {
                            final product =
                                productsController.productsList[index];
                            final isInCart = _cartController.cartItems
                                .any((item) => item.productId == product.id);
                            final inCartIndex = _cartController.cartItems
                                .indexWhere(
                                    (item) => item.productId == product.id);
                            print('cart qnt indx-->${inCartIndex}');
                            int totalAddedQty = 0;
                            if (inCartIndex != -1) {
                              CartItem foundItem =
                                  _cartController.cartItems[inCartIndex];
                              totalAddedQty = foundItem?.quantity ?? 0;
                            }
                            return TProductCardVertical(
                                product: product,
                                isInCart: isInCart,
                                totalAddedQty: totalAddedQty);
                          },
                        ),
                      );
                    }
                  }
                }),
              ),
            ],
          ),
        ));
  }
}
