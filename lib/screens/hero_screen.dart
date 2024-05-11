import 'package:farsight_vendor_app/screens/settings_screen.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:farsight_vendor_app/widgets/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:farsight_vendor_app/constants/colors.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  Map<String, dynamic> user = {};

  final GetStorage authStorage = GetStorage('authStorage');

  @override
  void initState() {
    super.initState();
    preloadData();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;

    return RefreshIndicator(
      onRefresh: () async {
        preloadData();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bg,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.grey,
                            ),
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Badge(
                      label: Text('1'),
                      child: Image(
                          height: 30,
                          width: 30,
                          image: AssetImage('assets/icons/img.png')),
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/main.png'))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    Container(
                      height: 150,
                      width: width,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  preloadData() async {
    // setState(() {
    //   shiftData = null;
    //   loadingShift = true;
    // });

    var userData = await authStorage.read('user');
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }

    // var res = await fetchShiftInfo();

    // if (res != null) {
    //   if (mounted) {
    //     setState(() {
    //       shiftData = res;
    //       loadingShift = false;
    //     });
    //   }
    // } else {
    //   if (mounted) {
    //     setState(() {
    //       shiftData = null;
    //       loadingShift = false;
    //     });
    //   }
    // }
  }
}
