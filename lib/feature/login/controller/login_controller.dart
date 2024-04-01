import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../service/network_handler/network_handler.dart';
import '../../landing_page/landing_page.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void login() async {
    LoginModel loginModel = LoginModel(
        identifier: mobileEditingController.text,
        password: passwordEditingController.text);
    var response = await NetworkHandler.post(
        loginModelToJson(loginModel), "vendor/auth/signin");

    var data = json.decode(response);
    print(data["status"]);
    if (data["status"] == 200) {
      Get.to(LandingPage());
    }
  }
}
