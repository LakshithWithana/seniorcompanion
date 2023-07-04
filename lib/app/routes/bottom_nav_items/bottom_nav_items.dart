import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seniorcompanion/features/search/presentation/pages/search_page.dart';

import '../../../core/shared/widgets/custom_text.dart';

List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: const Icon(Icons.search_outlined),
    label: 'search'.tr(),
  ),
  BottomNavigationBarItem(
    icon: const Icon(Icons.forum_outlined),
    label: 'chat'.tr(),
  ),
  BottomNavigationBarItem(
    icon: const Icon(Icons.favorite_outline),
    label: 'wellbeing'.tr(),
  ),
  BottomNavigationBarItem(
    icon: const Icon(Icons.notifications_none_outlined),
    label: 'notifications'.tr(),
  ),
  BottomNavigationBarItem(
    icon: const Icon(Icons.settings_outlined),
    label: 'settings'.tr(),
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  const SearchPage(),
  CustomText(
    text: "chat".tr().toUpperCase(),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
  CustomText(
    text: "wellbeing".tr().toUpperCase(),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
  CustomText(
    text: "notifications".tr().toUpperCase(),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
  CustomText(
    text: "settings".tr().toUpperCase(),
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
];
