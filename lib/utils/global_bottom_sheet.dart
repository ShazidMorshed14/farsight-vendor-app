import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showConfirmBottomSheet({
  required BuildContext context,
  String? title,
  String? message,
  required Future<void> Function() onConfirm,
}) async {
  // Create an observable to manage loading state
  RxBool isLoading = false.obs;

  showModalBottomSheet(
    context: context,
    isDismissible: true, // Prevent dismissing by tapping outside
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Obx(
        () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: Get.size.height * 0.4,
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
                    Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: isLoading.value
                            ? null
                            : () {
                                Get.back(); // Close the bottom sheet on cancel
                              },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 120,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Center(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: isLoading.value
                            ? null
                            : () async {
                                isLoading.value = true; // Show loading
                                await onConfirm(); // Execute the confirm action
                                isLoading.value = false; // Hide loading
                                Get.back(); // Close the bottom sheet
                              },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 120,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: isLoading.value
                              ? const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 4,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
