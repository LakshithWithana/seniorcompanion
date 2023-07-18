import 'package:flutter/material.dart';

import 'notification_view.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static Page page() => const MaterialPage<void>(child: NotificationPage());

  @override
  Widget build(BuildContext context) {
    return const NotificationView();
  }
}
