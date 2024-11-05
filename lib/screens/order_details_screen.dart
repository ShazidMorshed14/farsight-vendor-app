// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farsight_vendor_app/components/global/app_bars/custom_appbar_with_multi_actions.dart';
import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/screens/order_details_screen/order_life_cycle.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/controllers/order_details_controller.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/widgets/data_row.dart';
import 'package:farsight_vendor_app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String? ordeNo;
  const OrderDetailsScreen({
    Key? key,
    this.ordeNo,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final OrderDetailsController controller = Get.put(OrderDetailsController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchOrderDetails(widget.ordeNo!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: CustomAppBarwithMultipleActions(
        leftIcon: Icons.arrow_back_ios_new,
        onLeftIconPressed: () {
          Get.back();
        },
        title: 'Order Details',
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: TColors.tprimary,
          )); // Show loader while fetching data
        }

        if (controller.orderDetails.value?.id == null) {
          return const NoDataFound(desc: 'No Order Found!');
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.fetchOrderDetails(widget.ordeNo!);
          },
          child: ListView(
            children: [
              orderDetailsSection(controller.orderDetails.value!),
              OrderLifeCycle(),
            ],
          ),
        );
      }),
    );
  }

  Widget orderDetailsSection(Order orderDetails) {
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
            'Order Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DataRowWidget(
            title: 'Order#',
            value: '${controller.orderDetails.value?.orderNo ?? 'N/A'}',
            fontSize: 11,
          ),
          DataRowWidget(
            title: 'Order Placed',
            value: '${controller.orderDetails.value?.createdAt ?? 'N/A'}',
            fontSize: 11,
          ),
          DataRowWidget(
            title: 'Total',
            value: '${controller.orderDetails.value?.totalBill ?? '0.0'}',
            fontSize: 11,
          ),
          DataRowWidget(
            title: 'Sub-Total',
            value:
                '${controller.orderDetails.value?.totalDiscountedBill ?? '0.0'}',
            fontSize: 11,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(color: Colors.grey[300], height: 1),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Shipping Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${controller.orderDetails.value?.deliveryAddress ?? 'N/A'}',
            style: TextStyle(fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(color: Colors.grey[300], height: 1),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Contact No',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${controller.orderDetails.value?.contactNo ?? 'N/A'}',
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }

  Widget shippingAddressSection(String address) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(address),
        ),
      ],
    );
  }
}
