import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:newseniiorcompaniion/features/settings/cubit/settings_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class SearchSettingsView extends StatefulWidget {
  const SearchSettingsView({super.key, required this.preferences});
  final List<String?> preferences;

  @override
  State<SearchSettingsView> createState() => _SearchSettingsViewState();
}

class _SearchSettingsViewState extends State<SearchSettingsView> {
  @override
  void initState() {
    super.initState();
    for (var element in widget.preferences) {
      context.read<SettingsCubit>().addPreferencesSelection(element!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "searchSettings".tr().toUpperCase(),
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "preferences".tr().toUpperCase(),
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              const Wrap(
                spacing: 10.0,
                runSpacing: 5.0,
                children: [
                  SinglePreference(name: "adviser"),
                  SinglePreference(name: "bingo"),
                  SinglePreference(name: "boardGames"),
                  SinglePreference(name: "bookDiscussions"),
                  SinglePreference(name: "cardGames"),
                  SinglePreference(name: "cookingAndBaking"),
                  SinglePreference(name: "drawing"),
                  SinglePreference(name: "drivingArround"),
                  SinglePreference(name: "friend"),
                  SinglePreference(name: "gardening"),
                  SinglePreference(name: "healer"),
                  SinglePreference(name: "knitting"),
                  SinglePreference(name: "languageLearning"),
                  SinglePreference(name: "listingToMusic"),
                  SinglePreference(name: "memoryGames"),
                  SinglePreference(name: "mindfulness"),
                  SinglePreference(name: "natureExploration"),
                  SinglePreference(name: "outdoorActivities"),
                  SinglePreference(name: "painting"),
                  SinglePreference(name: "petTherapy"),
                  SinglePreference(name: "physicalActivity"),
                  SinglePreference(name: "playAnInstrument"),
                  SinglePreference(name: "puzzleGames"),
                  SinglePreference(name: "readingClub"),
                  SinglePreference(name: "relaxationExercises"),
                  SinglePreference(name: "singingAlone"),
                  SinglePreference(name: "socialActivities"),
                  SinglePreference(name: "storytelling"),
                  SinglePreference(name: "taiChi"),
                  SinglePreference(name: "yoga"),
                ],
              ),
              const SizedBox(height: 40.0),
              Center(
                child: CustomElevatedButton(
                  label: "Update",
                  onPressed: () {
                    context.read<SettingsCubit>().updatePreferences();
                  },
                  backgroundColor: mainColor,
                ),
              ),
              const SizedBox(height: 40.0),
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
                  ? () => contextS
                      .read<SettingsCubit>()
                      .removePreferencesSelection(name.tr())
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
                  child: CustomText(
                    text: name.tr().toUpperCase(),
                    fontSize: 16.0,
                    color: stateS.preferences.contains(name.tr())
                        ? white
                        : (stateA.user.role == "CG" ? mainBlue : mainOrange),
                    fontWeight: FontWeight.bold,
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
