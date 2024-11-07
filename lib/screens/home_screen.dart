import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/controllers/auth_controller.dart';
import 'package:farsight_vendor_app/controllers/cart_controller.dart';
import 'package:farsight_vendor_app/screens/cart_screen.dart';
import 'package:farsight_vendor_app/screens/category_screen.dart';
import 'package:farsight_vendor_app/screens/hero_screen.dart';
import 'package:farsight_vendor_app/screens/profile_screen.dart';
import 'package:farsight_vendor_app/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../foundation/sp_icon/sp_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartController _cartController = Get.put(CartController());
  final AuthController authController = Get.put(AuthController());

  int currentIndex = 0;

  List<Widget> pages = [
    const HeroScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  Map<String, dynamic> user = {};

  final GetStorage authStorage = GetStorage('authStorage');

  @override
  void initState() {
    super.initState();
    //preloadData();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authController.getUserDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.size.height;
    final screenWidth = Get.size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: TColors.tprimary,
        selectedLabelStyle: const TextStyle(fontSize: 13),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SPIcon(
                assetname: "logo-black.png",
                isSelected: currentIndex == 0 ? true : false,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SPIcon(
                assetname: "img.png",
                isSelected: currentIndex == 1 ? true : false,
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: SPIcon(
                assetname: "shopping-cart.png",
                isSelected: currentIndex == 2 ? true : false,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: SPIcon(
                assetname: "profile.png",
                isSelected: currentIndex == 3 ? true : false,
              ),
              label: "Profile"),
        ],
      ),
      body: pages[currentIndex],
    );
  }

  preloadData() async {
    var userData = await authStorage.read('user');
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }
  }
}
