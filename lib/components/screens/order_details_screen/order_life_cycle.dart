import 'package:another_stepper/another_stepper.dart';
import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/controllers/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderLifeCycle extends StatelessWidget {
  const OrderLifeCycle({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = Get.find<OrderDetailsController>();

    List<StepperData> stepperData = [
      StepperData(
          title: StepperText(
            "Order Placed",
          ),
          subtitle: StepperText("Your order has been placed"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.check, color: Colors.white),
          )),
      StepperData(
          title: StepperText("Preparing"),
          subtitle: StepperText("Your order is being prepared"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.check, color: Colors.white),
          )),
      StepperData(
          title: StepperText("On the way"),
          subtitle: StepperText(
              "Our delivery executive is on the way to deliver your item"),
          iconWidget: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: const Icon(Icons.check, color: Colors.white),
          )),
      StepperData(
        title: StepperText("Delivered",
            textStyle: const TextStyle(
              color: Colors.grey,
            )),
      ),
    ];

    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order History',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Obx(() {
              if (orderDetailsController.orderDetails.value?.orderLifeHistory !=
                      null &&
                  orderDetailsController
                      .orderDetails.value!.orderLifeHistory!.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text('No history found'),
                  ),
                );
              }

              return AnotherStepper(
                stepperList: orderDetailsController
                    .convertOrderLifeHistoryToStepperData(),
                stepperDirection: Axis.vertical,
                iconWidth:
                    40, // Height that will be applied to all the stepper icons
                iconHeight:
                    40, // Width that will be applied to all the stepper icons
              );
            })
          ],
        ));
  }
}
