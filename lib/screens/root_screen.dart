import 'package:farsight_vendor_app/screens/home_screen.dart';
import 'package:farsight_vendor_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';

import 'package:farsight_vendor_app/main.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/utils/root_bindings.dart';
import 'package:farsight_vendor_app/utils/getx_network_manager.dart';

import 'package:farsight_vendor_app/screens/signin_screen.dart';
import 'package:farsight_vendor_app/screens/splash_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool _isAuthenticated = false;
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    preloadData();
    hideSplash();

    GetStorage authStorage = GetStorage('authStorage');
    authStorage.listenKey('isAuth', (value) {
      if (mounted && value != null) {
        setState(() {
          _isAuthenticated = value ?? false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: mode == 'dev',
      debugShowCheckedModeBanner: false,
      initialBinding: RootBindings(),
      title: 'Farsight App',
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   fontFamily: 'Mulish',
      //   primaryColor: const Color(0xff5567f7),
      // ),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: RenderScreen(
        showSplash: _showSplash,
        isAuthenticated: _isAuthenticated,
      ),
    );
  }

  void preloadData() async {
    GetStorage authStorage = GetStorage('authStorage');
    // ignore: await_only_futures
    bool authState = await authStorage.read('isAuth') ?? false;
    if (mounted) {
      setState(() {
        _isAuthenticated = authState;
      });
    }
  }

  void hideSplash() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showSplash = false;
      });
    });
  }
}

class RenderScreen extends StatefulWidget {
  const RenderScreen({
    super.key,
    required this.showSplash,
    required this.isAuthenticated,
  });

  final bool showSplash;
  final bool isAuthenticated;

  @override
  State<RenderScreen> createState() => _RenderScreenState();
}

class _RenderScreenState extends State<RenderScreen> {
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  @override
  void initState() {
    super.initState();
    log('Mode: ${env['mode']}');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetXNetworkManager>(
      builder: (builder) => !_networkManager.hasConnection
          ? const NoInternetConnetion()
          : widget.showSplash == true
              ? const SplashScreen()
              : widget.isAuthenticated
                  ? const HomeScreen()
                  : const SignInScreen(),
    );
  }
}

class NoInternetConnetion extends StatelessWidget {
  const NoInternetConnetion({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;

    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
            width: width,
            height: height,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 64,
                  color: red,
                ),
                SizedBox(height: 20),
                Text(
                  'No Internet',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text('Please check your internet connection')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
