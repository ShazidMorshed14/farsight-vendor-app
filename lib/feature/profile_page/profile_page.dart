import 'package:flutter/material.dart';

import '../../foundation/theme/colors.dart';
import 'profile_without_login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldBGColor,
        appBar: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          backgroundColor: AppColor.whiteColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(child: ProfileWithoutLogin()));
  }
}
