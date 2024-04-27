import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../service/network_handler/network_handler.dart';
import '../../landing_page/landing_page.dart';
import '../../reset_password_page/reset_password_page.dart';
import '../model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  void login() async {
    LoginModel loginModel = LoginModel(
        identifier: '+880${mobileEditingController.text}',
        password: passwordEditingController.text);

    try {
      var response = await NetworkHandler.post(
          loginModelToJson(loginModel), "vendor/auth/signin");

      var data = json.decode(response);

      if (data["status"] == 200) {
        await NetworkHandler.storeToken(data["data"]["token"]);
        Get.offAll(() => LandingPage());
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Center(
                  child: Text("Logged in successfully!"),
                ),
                contentPadding: EdgeInsets.all(30),
                children: [
                  Text(
                      'Validation successful. Please check your profile for your details.')
                ],
              );
            });
      } else if (data["status"] == 203) {
        String id = data["data"]["_id"];
        Get.to(() => ResetPasswordPage(id: id));
      } else if (data["status"] == 409) {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Center(
                  child: Text("Password didn't matched"),
                ),
                contentPadding: EdgeInsets.all(30),
                children: [
                  Text(
                      'Validation Failed. Please check your phone and password')
                ],
              );
            });
      } else {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Center(
                  child: Text('Something went wrong'),
                ),
                contentPadding: EdgeInsets.all(30),
                children: [
                  Text('Some error occuring, Please contact the admin')
                ],
              );
            });
      }
    } catch (error) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Center(
                child: Text('Something went wrong'),
              ),
              contentPadding: EdgeInsets.all(30),
              children: [Text('Some error occuring, Please contact the admin')],
            );
          });
    }
  }
}
