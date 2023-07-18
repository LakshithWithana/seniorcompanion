import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/emergency_and_reminders_tab_view.dart';
import 'package:seniorcompanion/features/notifications/notifications/notification_tab_view.dart';

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
      child: Column(
        children: [
          tabbar,
          SizedBox(
            height: MediaQuery.of(context).size.height -
                tabbar.preferredSize.height -
                150,
            child: const TabBarView(
              children: [
                EmergencyAndRemindersTabView(),
                NotificationTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
