import 'package:farsight_vendor_app/screens/cart_screen.dart';
import 'package:farsight_vendor_app/screens/category_screen.dart';
import 'package:farsight_vendor_app/screens/hero_screen.dart';
import 'package:farsight_vendor_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../foundation/sp_icon/sp_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> pages = [
    const HeroScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
    const CartScreen()
  ];
  Map<String, dynamic> user = {};

  final GetStorage authStorage = GetStorage('authStorage');

  @override
  void initState() {
    super.initState();
    preloadData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.size.height;
    final screenWidth = Get.size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffef7d00),
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
                assetname: "categories.png",
                isSelected: currentIndex == 1 ? true : false,
              ),
              label: "Categories"),
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
