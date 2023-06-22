import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/user_home/presentation/pages/user_home_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key, required this.role});
  final String role;

  static Page page({required String role}) =>
      MaterialPage<void>(child: UserHomePage(role: role));

  @override
  Widget build(BuildContext context) {
    return UserHomeView(role: role);
  }
}
