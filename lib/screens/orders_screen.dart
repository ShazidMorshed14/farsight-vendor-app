import 'package:farsight_vendor_app/components/global/no_data_found.dart';
import 'package:farsight_vendor_app/components/screens/orders/order_card.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:flutter/material.dart';
import 'package:farsight_vendor_app/widgets/screen.dart';
import 'package:farsight_vendor_app/components/global/app_bars/custom_appbar_with_multi_actions.dart';
import 'package:farsight_vendor_app/controllers/order_controller.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrderController controller = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchAllOrders();
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
          title: 'Order History',
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: TColors.tprimary,
            )); // Show loader while fetching data
          }

          if (controller.ordersList.isEmpty) {
            return const NoDataFound(desc: 'No Orders Found!');
          }

          return SizedBox(
              height: Get.size.height * 0.85,
              child: RefreshIndicator(
                color: Colors.green,
                onRefresh: () async {
                  controller.fetchAllOrders();
                },
                child: ListView.builder(
                    itemCount: controller.ordersList.length,
                    itemBuilder: (context, index) {
                      Order order = controller.ordersList[index];

                      return OrderCard(order: order);
                    }),
              ));
        }));
  }
}
