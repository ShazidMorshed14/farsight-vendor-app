import 'package:farsight_vendor_app/model/user.dart';
import 'package:farsight_vendor_app/screens/signin_screen.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  var user = Rxn<User>();

  Future<void> getUserDetails() async {
    print('gg calling user details fetch...');
    GetStorage authStorage = GetStorage('authStorage');
    var userDetails = authStorage.read('user');
    print(userDetails);

    if (userDetails != null) {
      // If user details are found, assign them to `user`
      user.value = User.fromJson(
          userDetails); // Assuming you have a fromJson method in the User model
    } else {
      navigator!.pushAndRemoveUntil(
        createPageRoute(SignInScreen()),
        (route) => false,
      );
    }
  }
}
