import 'package:farsight_vendor_app/components/widgets/containers/rounded_container.dart';
import 'package:farsight_vendor_app/model/order.dart';
import 'package:farsight_vendor_app/screens/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    MaterialColor _getStatusColor(String? status) {
      switch (status) {
        case 'PENDING':
          return Colors.orange;
        case 'CONFIRMED':
        case 'DELIVERED':
          return Colors.green;
        case 'PACKED':
          return Colors.blue;
        case 'SHIPPED':
          return Colors.green;
        case 'RETURNED':
        case 'CANCELLED':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    return InkWell(
      onTap: () {
        Get.to(() => OrderDetailsScreen(ordeNo: order.orderNo));
      },
      child: Card(
        color: Colors.white,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              // Order Number and Date Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TRoundedContainer(
                      radius: 4,
                      backgroundColor: _getStatusColor(order.orderStatus),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 8.0),
                        child: Text(
                          order.orderStatus ?? 'N/A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Order#: ${order.orderNo ?? 'N/A'}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${order.createdAt?.toLocal().toString().split(' ')[0] ?? 'N/A'}",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Total : ${order.totalDiscountedBill ?? '0.0'} ৳",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Estimated Delivery on ${order.apxDeliveryDate?.toLocal().toString().split(' ')[0] ?? 'N/A'}",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              if (order.orderedProducts != null &&
                  order.orderedProducts!.isNotEmpty)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Display the product image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        order.orderedProducts![0].productId?.productPictures?[0]
                                .img ??
                            'default_image_url',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Display +1, +2 etc., if more products
                    if (order.orderedProducts!.length > 1)
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "+${order.orderedProducts!.length - 1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
