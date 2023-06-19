import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/models/user_model.dart';
import 'package:seniorcompanion/features/authentication/login/login.dart';
import 'package:provider/provider.dart';
import 'package:seniorcompanion/features/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SCUser?>(context);

    if (user == null) {
      return const Login();
    } else {
      return const Home();
    }
  }
}
