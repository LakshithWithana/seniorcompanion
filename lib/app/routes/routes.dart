import 'package:flutter/material.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/features/authentication/login/presentation/pages/login_page.dart';
import 'package:seniorcompanion/features/profile/presentation/pages/profile_page.dart';
import 'package:seniorcompanion/features/user_home/presentation/pages/user_home_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.unAuthenticated:
      return [LoginPage.page()];
    case AppStatus.incompleteProfile:
      return [ProfilePage.page()];
    case AppStatus.careRecipient:
      return [UserHomePage.page(role: "CR")];
    case AppStatus.careGiver:
      return [UserHomePage.page(role: "CG")];
  }
}
