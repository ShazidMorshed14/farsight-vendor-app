import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../foundation/sp_password_field/sp_password_field.dart';
import '../../foundation/sp_solid_button/sp_solid_button.dart';
import '../../foundation/sp_text_field/sp_text_field.dart';
import '../../foundation/theme/colors.dart';
import '../login/controller/login_controller.dart';
import 'controller/reset_password_controller.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key, this.id}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String? id;

  final LoginController loginController = Get.find();
  final ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    // Set the initial value to the controller
    resetPasswordController.userIdTextController.text = id ?? 'N/A';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'Reset Password for User: +880${loginController.mobileEditingController.text}', // Displaying the id value
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: AppColor.captionColor,
                      fontSize: 13,
                    ),
                    controller: resetPasswordController.userIdTextController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColor.captionColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.black54,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SPPasswordFormField(
                  labelText: "Enter Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  textEditingController:
                      resetPasswordController.passwordTextController,
                ),
                SizedBox(height: 15),
                SPPasswordFormField(
                  labelText: "Confirm Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Confirm Password can't be empty";
                    }
                    return null;
                  },
                  textEditingController:
                      resetPasswordController.confirmPasswordTextController,
                ),
                SizedBox(height: 15),
                SPSolidButton(
                  text: 'Change Password',
                  onPressed: () => {
                    formKey.currentState!.validate(),
                    resetPasswordController.resetPassword()
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
