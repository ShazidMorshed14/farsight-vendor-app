import 'package:another_stepper/another_stepper.dart';
import 'package:dio/dio.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/model/cart_item.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/screens/home_screen.dart';
import 'package:farsight_vendor_app/service/order.dart';
import 'package:farsight_vendor_app/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  static OrderDetailsController get instance => Get.find();

  var isLoading = true.obs;

  var orderDetails = Rxn<Order>();

  Future<void> fetchOrderDetails(String orderNo) async {
    try {
      isLoading(true);
      final Order? foundOrder =
          await fetchOrderDetailsByOrderNo(orderNo); // Await the future
      if (foundOrder != null) {
        orderDetails.value = foundOrder; // Directly assign the Order
      } else {
        print('No data found for Order No: $orderNo');
      }
    } catch (e) {
      print('An unexpected error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

  List<StepperData> convertOrderLifeHistoryToStepperData() {
    if (orderDetails.value?.orderLifeHistory != null &&
        orderDetails.value!.orderLifeHistory!.isNotEmpty) {
      List<StepperData> stepperData =
          orderDetails.value!.orderLifeHistory!.reversed.map((history) {
        String title = history.label ?? "";
        String subtitle = history.description ?? "";

        return StepperData(
          title: StepperText(title),
          subtitle: StepperText(subtitle),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: TColors.tprimary,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.check, color: Colors.white),
          ),
        );
      }).toList();

      return stepperData;
    }

    return [];
  }
}
