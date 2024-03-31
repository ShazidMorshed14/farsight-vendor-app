import 'package:flutter/material.dart';

import '../../foundation/sp_icon/sp_icon.dart';
import '../categories_page/categories_page.dart';
import '../home_page/home_page.dart';
import '../profile_page/profile_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  List<Widget> pages = [HomePage(), CategoriesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xfffe416c),
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
                assetname: "profile.png",
                isSelected: currentIndex == 2 ? true : false,
              ),
              label: "Profile"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
