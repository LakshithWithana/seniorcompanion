import 'package:flutter/material.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';

import '../../features/authentication/login/presentation/pages/login_page.dart';
import '../../features/user_home/presentation/pages/user_home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Page page() => const MaterialPage<void>(child: SplashScreen());

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (context) => const UserHomePage(role: "CG")),
      //     (Route<dynamic> route) => false);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const UserHomePage(role: "CG")));
    });
    return Scaffold(
      backgroundColor: mainColor,
      body: Image.asset("assets/images/logo.png"),
    );
  }
}
