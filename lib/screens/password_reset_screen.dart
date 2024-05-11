import 'package:farsight_vendor_app/screens/signin_screen.dart';
import 'package:farsight_vendor_app/service/auth.dart';
import 'package:farsight_vendor_app/styles/styles.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:farsight_vendor_app/widgets/button.dart';
import 'package:farsight_vendor_app/widgets/no_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key, required this.id, this.phone});

  final String id;
  final String? phone;

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (!mounted) {
      _passwordController.dispose();
      _confirmPasswordController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;
    FocusScopeNode node = FocusScope.of(context);

    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      extendBody: true,
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: NoScrollGlow(
                  child: SingleChildScrollView(
                child: SizedBox(
                  width: width,
                  height: height - 35,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Get.size.height * 0.2,
                              child: Lottie.asset(
                                'assets/animation/cart.json',
                              ),
                            ),
                            const Text(
                              "Reset Password",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Password Reset Required for ${widget.phone}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              autocorrect: false,
                              controller: _passwordController,
                              enableSuggestions: false,
                              obscureText: !_passwordVisible,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: () {
                                node.unfocus();
                                //handleLogin();
                              },
                              decoration: Styles.customTextFieldStyle(
                                hintTextStr: '********',
                                labelTextStr: 'Enter New Password',
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    color: Colors.grey.shade500,
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              autocorrect: false,
                              controller: _confirmPasswordController,
                              enableSuggestions: false,
                              obscureText: !_passwordVisible,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onEditingComplete: () {
                                node.unfocus();
                                //handleLogin();
                              },
                              decoration: Styles.customTextFieldStyle(
                                hintTextStr: '********',
                                labelTextStr: 'Confirm New Password',
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    color: Colors.grey.shade500,
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your password';
                                }
                                if (value != _passwordController.text) {
                                  return "Password didn't matched!";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Button(
                                title: 'Reset Password',
                                width: width,
                                isLoading: isLoading,
                                onPressed: handleResetPassword),
                            const SizedBox(height: 10),
                            const Text(
                              'Developed by Shazid Morshed.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              )))),
    );
  }

  void handleResetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    bool success = await updatePassword(
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      id: widget.id,
    );

    if (success) {
      navigator!.pushAndRemoveUntil(
        createPageRoute(
          const SignInScreen(),
        ),
        (route) => false,
      );
      return;
    }

    setState(() {
      isLoading = false;
    });
  }
}
