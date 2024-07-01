import 'package:farsight_vendor_app/model/user.dart';
import 'package:farsight_vendor_app/screens/home_screen.dart';
import 'package:farsight_vendor_app/screens/password_reset_screen.dart';
import 'package:farsight_vendor_app/service/auth.dart';
import 'package:farsight_vendor_app/widgets/no_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:farsight_vendor_app/styles/styles.dart';
import 'package:farsight_vendor_app/utils/routing.dart';
import 'package:farsight_vendor_app/widgets/button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      _phoneController.dispose();
      _passwordController.dispose();
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
                            Image.asset(
                              'assets/images/logo-big.png',
                              width: width * 0.25,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Farsight',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              onEditingComplete: node.nextFocus,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: Styles.customTextFieldStyle(
                                  labelTextStr: 'Enter Contact No.',
                                  hintTextStr: '01786990237'),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your  phone number';
                                }

                                final RegExp phoneRegex = RegExp(r'^\d{11}$');
                                if (!phoneRegex.hasMatch(value)) {
                                  return 'Enter a valid phone no.';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
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
                                labelTextStr: 'Enter Password',
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
                            Button(
                                title: 'Sign In',
                                width: width,
                                isLoading: isLoading,
                                onPressed: handleLogin),
                            const SizedBox(height: 10),
                            const Text(
                              'Developed by Shazid Morshed.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }

  void handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    User user = await signin(
      identifier: _phoneController.text,
      password: _passwordController.text,
    );

    GetStorage authStorage = GetStorage('authStorage');
    // ignore: await_only_futures
    bool isAuth = await authStorage.read('isAuth') ?? false;

    //bool isAuth = true;

    if (isAuth == true) {
      setState(() {
        isLoading = false;
      });
      navigator!.pushAndRemoveUntil(
        createPageRoute(
          const HomeScreen(),
        ),
        (route) => false,
      );

      return;
    }

    if (user.isPassResetReq == true) {
      navigator!.pushAndRemoveUntil(
        createPageRoute(
          //PasswordResetScreen(phone: _phoneController.text),
          PasswordResetScreen(
              id: user.id, phone: '+88${_phoneController.text}'),
        ),
        (route) => false,
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
