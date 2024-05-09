import 'package:flutter/material.dart';
import 'package:get/get.dart';

successNotif({required String message, String? title}) {
  return Get.showSnackbar(
    GetSnackBar(
      icon: const Icon(Icons.done_all, color: Colors.white),
      message: message,
      title: title,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      backgroundColor: const Color(0xff7FB77E),
      snackStyle: SnackStyle.GROUNDED,
    ),
  );
}

errorNotif({required String message, String? title}) {
  return Get.showSnackbar(
    GetSnackBar(
      icon: const Icon(Icons.done_all, color: Colors.white),
      message: message,
      title: title,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      backgroundColor: const Color(0xffFA7070),
      snackStyle: SnackStyle.GROUNDED,
    ),
  );
}

infoNotif({required String message, String? title}) {
  return Get.showSnackbar(
    GetSnackBar(
      icon: const Icon(Icons.done_all, color: Colors.white),
      message: message,
      title: title,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      backgroundColor: const Color(0xff4562f7),
      snackStyle: SnackStyle.GROUNDED,
    ),
  );
}

warningNotif({required String message, String? title}) {
  return Get.showSnackbar(
    GetSnackBar(
      icon: const Icon(Icons.done_all, color: Colors.white),
      message: message,
      title: title,
      duration: const Duration(milliseconds: 2500),
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      backgroundColor: const Color(0xffF1A661),
      snackStyle: SnackStyle.GROUNDED,
    ),
  );
}
