import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:seniorcompanion/features/settings/cubit/settings_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class SearchSettingsView extends StatelessWidget {
  const SearchSettingsView({super.key, required this.preferences});
  final List<String?> preferences;

  @override
  Widget build(BuildContext context) {
    for (var element in preferences) {
      context.read<SettingsCubit>().addPreferencesSelection(element!);
    }

    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "searchSettings".tr().toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                key: const Key("search_settings_preferences_selecter"),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "preferences".tr().toUpperCase(),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "artLover"),
                      SinglePreference(name: "adviser"),
                      SinglePreference(name: "aide"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "bookWarm"),
                      SinglePreference(name: "boardGamer"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "buddy"),
                      SinglePreference(name: "cleaner"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "companion"),
                      SinglePreference(name: "communicator"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "cook"),
                      SinglePreference(name: "confidente"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "custodian"),
                      SinglePreference(name: "driver"),
                      SinglePreference(name: "friend"),
                      // SinglePreference(name: "filmFanatic")
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "filmFanatic"),
                      SinglePreference(name: "guide"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "hangout"),
                      SinglePreference(name: "healer"),
                      SinglePreference(name: "helper"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "houseSitter"),
                      SinglePreference(name: "instructor"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "nurse"),
                      SinglePreference(name: "psychoTherapist"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "sidekick"),
                      SinglePreference(name: "sportsLover"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "therapist"),
                      SinglePreference(name: "trainer"),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SinglePreference(name: "traveller"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomElevatedButton(
                label: "Update",
                onPressed: () {
                  context.read<SettingsCubit>().updatePreferences();
                },
                backgroundColor: mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SinglePreference extends StatelessWidget {
  const SinglePreference({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      // buildWhen: (previous, current) =>
      //     previous.preferences.length != current.preferences.length,
      builder: (contextS, stateS) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (contextA, stateA) {
            return ElevatedButton(
              onPressed: stateS.preferences.contains(name.tr())
                  ? null
                  : () => contextS
                      .read<SettingsCubit>()
                      .addPreferencesSelection(name.tr()),
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: stateS.preferences.contains(name.tr())
                    ? (stateA.user.role == "CG" ? mainBlue : mainOrange)
                    : white,
                backgroundColor: stateS.preferences.contains(name.tr())
                    ? (stateA.user.role == "CG" ? mainBlue : mainOrange)
                    : white,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: (stateA.user.role == "CG" ? mainBlue : mainOrange),
                      width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              child: SizedBox(
                height: 40.0,
                // width: 110.0.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        CustomText(
                          text: name.tr().toUpperCase(),
                          fontSize: 16.0.sp,
                          color: stateS.preferences.contains(name.tr())
                              ? white
                              : (stateA.user.role == "CG"
                                  ? mainBlue
                                  : mainOrange),
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 5.0),
                        stateS.preferences.contains(name.tr())
                            ? InkWell(
                                onTap: () {
                                  contextS
                                      .read<SettingsCubit>()
                                      .removePreferencesSelection(name.tr());
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: (stateA.user.role == "CG"
                                      ? Colors.red
                                      : yellow),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
