import 'package:farsight_vendor_app/model/order.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  SizedBox(height: 8),
                  Text(
                    "Estimated Delivery on ${order.apxDeliveryDate ?? 'N/A'}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Product Image and Count
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
    );
  }
}
