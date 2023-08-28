import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/chat/presentation/chat_page.dart';
import 'package:seniorcompanion/features/notifications/presentation/pages/notification_page.dart';
import 'package:seniorcompanion/features/search/presentation/pages/search_page.dart';
import 'package:seniorcompanion/features/settings/presentation/settings_page.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Image.asset(
      "assets/images/icons/search_inac.png",
      scale: 1.5,
    ),
    label: 'search'.tr(),
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      "assets/images/icons/chat_inac.png",
      scale: 1.5,
    ),
    label: 'chat'.tr(),
  ),
  // BottomNavigationBarItem(
  //   icon: const Icon(Icons.favorite_outline),
  //   label: 'wellbeing'.tr(),
  // ),
  BottomNavigationBarItem(
    icon: Image.asset(
      "assets/images/icons/notifications_inac.png",
      scale: 1.5,
    ),
    label: 'notifications'.tr(),
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      "assets/images/icons/profile_inac.png",
      scale: 1.5,
    ),
    label: 'settings'.tr(),
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  const SearchPage(),
  const ChatPage(),
  const NotificationPage(),
  const SettingsPage(),
];
