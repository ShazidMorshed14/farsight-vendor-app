import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../service/network_handler/network_handler.dart';

import '../model/reset_password_model.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController userIdTextController = TextEditingController();

  void resetPassword() async {
    ResetPasswordModel resetPasswordModel = ResetPasswordModel(
        password: passwordTextController.text,
        confirmPassword: confirmPasswordTextController.text);

    try {
      var response = await NetworkHandler.put(
          resetPasswordModelToJson(resetPasswordModel),
          "vendor/auth/reset-password/${userIdTextController.text}");

      var data = json.decode(response);

      if (data["status"] == 200) {
        Get.back();
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Center(
                  child: Text('Password Reset Successful!'),
                ),
                contentPadding: EdgeInsets.all(30),
                children: [Text('User Password Reset Successful!')],
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
