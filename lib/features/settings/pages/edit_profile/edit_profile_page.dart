import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/features/settings/cubit/settings_cubit.dart';
import 'package:seniorcompanion/features/settings/data/repositories/settings_repository.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/edit_profile_view.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.userDetails});
  final UserDetails userDetails;

  static Page page({required UserDetails userDetails}) =>
      MaterialPage<void>(child: EditProfilePage(userDetails: userDetails));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SettingsCubit(settingsRepository: locator<SettingsRepository>()),
      child: EditProfileView(userDetails: userDetails),
    );
  }
}
