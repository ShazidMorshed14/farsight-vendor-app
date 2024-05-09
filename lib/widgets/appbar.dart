import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:farsight_vendor_app/utils/bottom_sheet.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
    this.isExiting,
    this.cancelMessage,
    required this.title,
    this.showCancelButton,
    this.exitScreenCallback,
  }) : super(key: key);

  final String title;
  final bool? isExiting;
  final String? cancelMessage;
  final bool? showCancelButton;
  final VoidCallback? exitScreenCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        showCancelButton == true
            ? SizedBox(
                height: 35,
                child: Material(
                  color: const Color.fromARGB(255, 240, 5, 83),
                  borderRadius: BorderRadius.circular(200),
                  child: InkWell(
                    onTap: showCancelDialog,
                    child: const Row(
                      children: [
                        SizedBox(width: 15),
                        Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.cancel,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  void exitScreen() {
    navigator!.pop();
    navigator!.pop();
  }

  void showCancelDialog() {
    showConfirmAlert(
      title: 'Cancel',
      isLoading: isExiting ?? false,
      onConfirm: exitScreenCallback ?? exitScreen,
      message: cancelMessage ?? 'Are you sure you want to cancel?',
    );
  }
}
