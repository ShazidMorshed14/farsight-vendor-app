import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/widgets/appbar/appbar.dart';
import 'package:farsight_vendor_app/components/widgets/cart/cart_item.dart';
import 'package:farsight_vendor_app/components/widgets/headings/section_heading.dart';
import 'package:farsight_vendor_app/constants/sizes.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/controllers/order_controller.dart'; // Import the OrderController
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/utils/bottom_sheet.dart';
import 'package:farsight_vendor_app/utils/global_bottom_sheet.dart';
import 'package:farsight_vendor_app/utils/global_utils.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:farsight_vendor_app/widgets/data_row.dart';
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1), // Light background color
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Obx(() => Column(
                    children: [
                      DataRowWidget(
                        title: "Total:",
                        value:
                            "${_cartController.get_total_bill ?? 0.0} ${tk_sign}",
                        isBold: true,
                        fontSize: 14,
                      ),
                      DataRowWidget(
                        title: "Discount:",
                        value:
                            "- ${_cartController.get_total_discount ?? 0.0} ${tk_sign}",
                        isBold: true,
                        fontSize: 14,
                        valueColor: Colors.green,
                      ),
                      DataRowWidget(
                        title: "Sub-Total:",
                        value: "${_cartController.subtotal ?? 0.0} ${tk_sign}",
                        isBold: true,
                        fontSize: 14,
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 12.0),
            Button(
              width: Get.size.width,
              onPressed: () {
                if (_orderController.deliveryAddressController.text.isEmpty ||
                    _orderController.contactController.text.isEmpty ||
                    _orderController.nameController.text.isEmpty ||
                    _orderController.selectedPaymentMethod.value.isEmpty) {
                  errorNotif(message: "Please provide required informations");
                } else {
                  showConfirmBottomSheet(
                    context: context,
                    title: 'Place the order!',
                    onConfirm: () async {
                      await _orderController.placeOrder(
                          total_bill: _cartController.get_total_bill,
                          total_discounted_bill: _cartController.subtotal,
                          customer_name: _orderController.nameController.text,
                          contact_no: _orderController.contactController.text,
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
          ],
        ),
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
                                'Total: ${item.product_discounted_price} ${tk_sign}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Visibility(
                                visible: item.product_discounted_price <
                                        item.product_total_price
                                    ? true
                                    : false,
                                child: Text(
                                  '${item.product_total_price} ${tk_sign}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
            }),

            const SizedBox(height: 20),

            TSectionHeading(
              title: 'Customer Informations',
              leftPadding: 0,
              showActionButton: false,
            ),

            const SizedBox(height: 20),

            // TextField with TextEditingController for delivery address
            TextFormField(
              controller: _orderController.contactController,
              focusNode: _orderController.contactFocusNode, // Attach focus node
              decoration: InputDecoration(
                labelText: 'Enter Contact No',
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // Fix the label to the top
                border: OutlineInputBorder(),
              ),
              maxLines: 1, // Text area size
              minLines: 1,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your  phone number';
                }

                final RegExp phoneRegex = RegExp(r'^\d{11}$');
                if (!phoneRegex.hasMatch(value)) {
                  return 'Enter a valid phone no.';
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _orderController.nameController,
              focusNode: _orderController.nameFocusNode, // Attach focus node
              decoration: InputDecoration(
                labelText: 'Enter Name',
                floatingLabelBehavior:
                    FloatingLabelBehavior.always, // Fix the label to the top
                border: OutlineInputBorder(),
              ),
              maxLines: 1, // Text area size
              minLines: 1,
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your name';
                }

                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            // Delivery address section
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
          ],
        ),
      ),
    );
  }
}
