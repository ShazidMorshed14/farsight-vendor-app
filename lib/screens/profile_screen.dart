import 'package:farsight_vendor_app/controllers/auth_controller.dart';
import 'package:farsight_vendor_app/screens/orders_screen.dart';
import 'package:farsight_vendor_app/service/auth.dart';
import 'package:farsight_vendor_app/utils/bottom_sheet.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/images/avatar-thumb.png'), // Replace with your image
          ),
          SizedBox(height: 10),
          Obx(
            () => Text(
              authController.user.value?.name ?? 'Unknown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Active status',
            style: TextStyle(fontSize: 14, color: Colors.green),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                ProfileMenuItem(
                  icon: Icons.edit,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.location_on,
                  title: 'Shopping Address',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.favorite_border,
                  title: 'Wishlist',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.history,
                  title: 'Order History',
                  onTap: () {
                    navigator!.push(
                      createPageRoute(
                        OrdersScreen(),
                      ),
                    );
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.notifications,
                  title: 'Notification',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout_outlined,
                  title: 'Logout',
                  onTap: () async {
                    showConfirmAlert(
                        message: 'Do you want to logout?',
                        onConfirm: () async {
                          await logout();
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ProfileMenuItem(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing:
          Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 16),
      onTap: onTap,
    );
  }
}
