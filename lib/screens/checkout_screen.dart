import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_item.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/order_controller.dart'; // Import the OrderController
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/utils/bottom_sheet.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final _cartController = CartController.instance;
  final _orderController =
      Get.put(OrderController()); // Initialize OrderController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: Obx(() => SizedBox(
              height: Get.size.height * 0.08,
              child: Button(
                onPressed: () {
                  if (_orderController.deliveryAddressController.text.isEmpty ||
                      _orderController.selectedPaymentMethod.value.isEmpty) {
                    errorNotif(
                        message:
                            "Please provide delivery address and payment method");
                  } else {
                    showConfirmAlert(
                      isLoading: _orderController.isBtnLoading.value,
                      onConfirm: () async {
                        await _orderController.placeOrder(
                            total_bill: _cartController.get_total_bill,
                            total_discounted_bill: _cartController.subtotal,
                            delivery_address:
                                _orderController.deliveryAddressController.text,
                            payment_method:
                                _orderController.selectedPaymentMethod.value,
                            ordered_products: _cartController.cartItems);
                      },
                    );
                  }
                },
                title: 'Place Order ${_cartController!.subtotal ?? 0} BDT',
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: ListView(
          children: [
            // Product showing section
            Obx(() {
              if (_cartController.cartItems.isEmpty) {
                return NoDataFound(
                  assetLink: 'assets/animation/cart_bag_count.json',
                  desc: 'No Item to order',
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemCount: _cartController.cartItems.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: TSizes.spaceBtwSections),
                    itemBuilder: (_, index) {
                      CartItem item = _cartController.cartItems[index];
                      return Column(
                        children: [
                          TCardItem(cartItem: item),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quantity: ${item.quantity}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Total: ${item.product_discounted_price}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${item.product_total_price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
            }),

            // Delivery address section
            const SizedBox(height: 20),
            TSectionHeading(
              title: 'Delivery Address',
              leftPadding: 0.0,
              showActionButton: false,
            ),
            const SizedBox(height: 20),
            // TextField with TextEditingController for delivery address
            // TextField with TextEditingController for delivery address
            TextField(
              controller: _orderController.deliveryAddressController,
              focusNode: _orderController
                  .deliveryAddressFocusNode, // Attach focus node
              decoration: InputDecoration(
                labelText: 'Enter delivery address',
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // Fix the label to the top
                border: OutlineInputBorder(),
              ),
              maxLines: 5, // Text area size
              minLines: 3,
              keyboardType: TextInputType.multiline, // Multiline input
            ),

            const SizedBox(height: 40),
            // Payment method section
            TSectionHeading(
              title: 'Payment Method',
              leftPadding: 0.0,
              showActionButton: false,
            ),

            // Payment method selection with custom titles
            Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Space the options evenly
                  children:
                      _orderController.paymentMethodTitles.entries.map((entry) {
                    String methodValue = entry.key;
                    String methodTitle = entry.value;

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<String>(
                          value: methodValue,
                          groupValue:
                              _orderController.selectedPaymentMethod.value,
                          onChanged: (value) {
                            _orderController.updatePaymentMethod(value!);
                          },
                        ),
                        Text(
                          methodTitle,
                          style:
                              TextStyle(fontSize: 12), // Set a small text size
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            }),

            const SizedBox(height: 20),

            // Button to proceed with checkout
            // ElevatedButton(
            //   onPressed: () {
            //     // Handle checkout action
            //     String address =
            //         _orderController.deliveryAddressController.text;
            //     String paymentMethod =
            //         _orderController.selectedPaymentMethod.value;

            //     // Proceed with order placement
            //     print('Delivery Address: $address');
            //     print('Payment Method: $paymentMethod');
            //   },
            //   child: Text('Place Order'),
            // ),
          ],
        ),
      ),
    );
  }
}
