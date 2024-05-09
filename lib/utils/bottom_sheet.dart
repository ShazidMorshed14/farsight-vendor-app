import 'package:lottie/lottie.dart';
import 'package:farsight_vendor_app/constants/colors.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showConfirmAlert({
  String? title,
  String? message,
  bool? isLoading,
  bool? isDismissible,
  VoidCallback? onCancel,
  required VoidCallback onConfirm,
}) {
  final height = Get.size.height;

  Get.bottomSheet(
    isDismissible: isDismissible ?? true,
    BottomSheet(
      enableDrag: false,
      onClosing: onCancel ??
          () {
            navigator!.pop();
          },
      builder: (BuildContext sheetContext) {
        return Container(
          height: height * 0.4,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title ?? 'Are you sure?',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message ?? 'Are you sure you want to do this?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    color: red,
                    width: 120,
                    size: 'small',
                    title: 'Cancel',
                    isDisabled: isLoading ?? false,
                    onPressed: onCancel ??
                        () {
                          navigator!.pop();
                        },
                  ),
                  const SizedBox(width: 15),
                  Button(
                    width: 120,
                    size: 'small',
                    title: 'Confirm',
                    onPressed: onConfirm,
                    isLoading: isLoading ?? false,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

showMessage({
  String? type,
  String? title,
  String? message,
  bool? isDismissible,
  bool animated = false,
  void Function()? onClose,
}) {
  final height = Get.size.height;

  Get.bottomSheet(
    isDismissible: isDismissible ?? true,
    BottomSheet(
      enableDrag: false,
      onClosing: onClose ??
          () {
            navigator!.pop();
          },
      builder: (BuildContext sheetContext) {
        return Container(
          height: height * 0.4,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: !animated,
                child: type == 'error'
                    ? const Icon(
                        Icons.error,
                        size: 60,
                        color: red,
                      )
                    : const Icon(
                        Icons.check_circle,
                        size: 60,
                        color: green,
                      ),
              ),
              Visibility(
                visible: animated,
                child: type == 'error'
                    ? Positioned(
                        child: SizedBox(
                          height: 120,
                          child: Lottie.asset(
                            'assets/anim/error.json',
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 120,
                        child: Lottie.asset(
                          'assets/anim/success.json',
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              Text(
                title ?? 'Yeah !!!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                message ?? 'Congratulation !!!  you have done it.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
