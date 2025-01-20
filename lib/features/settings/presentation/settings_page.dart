import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';
import 'package:newseniiorcompaniion/core/service_locator/service_locator.dart';
import 'package:newseniiorcompaniion/features/settings/cubit/settings_cubit.dart';
import 'package:newseniiorcompaniion/features/settings/data/repositories/settings_repository.dart';
import 'package:newseniiorcompaniion/features/settings/presentation/settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
          authRepository: locator<AuthRepository>(),
          settingsRepository: locator<SettingsRepository>()),
      child: SettingsView(),
    );
  }
}
