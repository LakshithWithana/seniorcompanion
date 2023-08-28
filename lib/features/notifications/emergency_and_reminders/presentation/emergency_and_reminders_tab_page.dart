import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:seniorcompanion/core/user_details/data/repository/user_details_repository.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/cubit/emergency_cubit.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/data/repository/emergency_repositoy.dart';

import 'emergency_and_reminders_tab_view.dart';

class EmergencyAndRemindersTabPage extends StatelessWidget {
  const EmergencyAndRemindersTabPage({super.key});

  static Page page() =>
      const MaterialPage<void>(child: EmergencyAndRemindersTabPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDetailsCubit(
              userDetailsRepository: locator<UserDetailsRepository>(),
              authRepository: locator<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => EmergencyCubit(
              emergencyRepository: locator<EmergencyRepository>()),
        ),
      ],
      child: const EmergencyAndRemindersTabView(),
    );
  }
}
