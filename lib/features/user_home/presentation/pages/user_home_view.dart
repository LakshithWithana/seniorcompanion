import 'package:flutter/material.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = locator();
    return Scaffold(
      appBar: AppBar(
        title: role == "CG"
            ? const Text("Caregiver")
            : const Text("Care Recipient"),
      ),
      body: ElevatedButton(
        onPressed: () {
          authRepository.signOutUser();
        },
        child: const Text("Logout"),
      ),
    );
  }
}
