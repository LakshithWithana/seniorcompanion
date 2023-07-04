import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/constants/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15.0),
        Divider(),
        SizedBox(height: 15.0),
      ],
    );
  }
}
