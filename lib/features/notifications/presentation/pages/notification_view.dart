import 'package:flutter/material.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/features/notifications/notifications/notification_tab_view.dart';

import '../../emergency_and_reminders/presentation/emergency_and_reminders_tab_page.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    TabBar tabbar = TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const BoxDecoration(color: mainColor),
      tabs: [
        Tab(text: "Emergency & Reminders".toUpperCase()),
        Tab(text: "Notifications".toUpperCase()),
      ],
      unselectedLabelColor: secondaryFontColor,
      labelColor: yellow,
    );
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            tabbar,
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  tabbar.preferredSize.height -
                  150,
              child: const TabBarView(
                children: [
                  EmergencyAndRemindersTabPage(),
                  NotificationTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
