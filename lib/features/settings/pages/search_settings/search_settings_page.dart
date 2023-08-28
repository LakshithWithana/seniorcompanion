import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/features/settings/cubit/settings_cubit.dart';
import 'package:seniorcompanion/features/settings/data/repositories/settings_repository.dart';
import 'package:seniorcompanion/features/settings/pages/search_settings/search_settings_view.dart';

class SearchSettingsPage extends StatelessWidget {
  const SearchSettingsPage({super.key, required this.preferences});
  final List<String?> preferences;

  static Page page({required List<String?> preferences}) =>
      MaterialPage<void>(child: SearchSettingsPage(preferences: preferences));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SettingsCubit(settingsRepository: locator<SettingsRepository>()),
        ),
      ],
      child: SearchSettingsView(preferences: preferences),
    );
  }
}
