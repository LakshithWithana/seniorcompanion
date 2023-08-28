import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';

import '../../../../app/data/repository/auth_repository.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/user_details/data/repository/user_details_repository.dart';
import '../../../notifications/emergency_and_reminders/cubit/emergency_cubit.dart';
import '../../../notifications/emergency_and_reminders/data/repository/emergency_repositoy.dart';
import 'emergency_settings_view.dart';

class EmergencySettingsPage extends StatelessWidget {
  const EmergencySettingsPage({
    Key? key,
    this.emergencyPhoneNumber,
    this.doctorPhoneNumber,
    this.ambulancePhoneNumber,
  }) : super(key: key);
  final String? emergencyPhoneNumber;
  final String? doctorPhoneNumber;
  final String? ambulancePhoneNumber;

  static Page page() =>
      const MaterialPage<void>(child: EmergencySettingsPage());

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
      child: EmergencySettingsView(
        emergencyPhoneNumber: emergencyPhoneNumber,
        doctorPhoneNumber: doctorPhoneNumber,
        ambulancePhoneNumber: ambulancePhoneNumber,
      ),
    );
  }
}
