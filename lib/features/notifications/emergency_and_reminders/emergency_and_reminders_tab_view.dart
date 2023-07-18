import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_elevated_buttons.dart';

class EmergencyAndRemindersTabView extends StatelessWidget {
  const EmergencyAndRemindersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
      child: Column(
        children: [
          CustomElevatedButton(
            onPressed: () {},
            label: "Emergency Call",
            backgroundColor: mainColor,
          ),
          const SizedBox(height: 15.0),
          CustomElevatedButton(
            onPressed: () {},
            label: "Call Doctor",
            backgroundColor: mainColor,
          ),
          const SizedBox(height: 15.0),
          CustomElevatedButton(
            onPressed: () {},
            label: "Call Ambulance",
            backgroundColor: mainColor,
          ),
        ],
      ),
    );
  }
}
