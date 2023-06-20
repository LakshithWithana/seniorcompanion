import 'package:flutter/material.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/features/authentication/login/presentation/pages/login_page.dart';
import 'package:seniorcompanion/features/care_recipient_home/presentation/care_recipient_home_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.unAuthenticated:
      return [LoginPage.page()];
    case AppStatus.careRecipient:
      return [CareRecipientHomePage.page()];
    case AppStatus.careGiver:
      return [CareRecipientHomePage.page()];
  }
}
