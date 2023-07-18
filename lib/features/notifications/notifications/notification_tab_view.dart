import 'package:flutter/material.dart';

class NotificationTabView extends StatelessWidget {
  const NotificationTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
      child: Column(
        children: [
          Text("No any notifications available."),
        ],
      ),
    );
  }
}
