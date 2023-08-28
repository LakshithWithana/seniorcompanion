import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/settings/presentation/settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}
