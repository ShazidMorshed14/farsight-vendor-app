import 'dart:io';
import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class GetXNetworkManager extends GetxController {
  bool hasConnection = true;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    initConnection();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStates);
  }

  @override
  void onClose() {
    super.onClose();
    _streamSubscription.cancel();
  }

  Future<bool> performInternetCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      log('Connection Error $e');
      return false;
    } on PlatformException catch (e) {
      log('Connection Error $e');
      return false;
    }
  }

  void initConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    updateConnectionStates(result);
  }

  void updateConnectionStates(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      bool response = await performInternetCheck();
      hasConnection = response;
      update();
      return;
    }

    hasConnection = false;
    update();
    return;
  }
}
