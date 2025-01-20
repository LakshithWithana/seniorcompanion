import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/features/profile/cubit/profile_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';
import '../../../../app/bloc/app_bloc.dart';

class PreferencesSelecterWidget extends StatelessWidget {
  const PreferencesSelecterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key("profile_form_preferences_selecter"),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "preferences".tr().toUpperCase(),
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            // maxHeight: 50.0,
            maxWidth: 353.0,
          ),
          child: const Wrap(
            spacing: 10.0,
            runSpacing: 5.0,
            children: [
              SingleItem(name: "adviser"),
              SingleItem(name: "bingo"),
              SingleItem(name: "boardGames"),
              SingleItem(name: "bookDiscussions"),
              SingleItem(name: "cardGames"),
              SingleItem(name: "cookingAndBaking"),
              SingleItem(name: "drawing"),
              SingleItem(name: "drivingArround"),
              SingleItem(name: "friend"),
              SingleItem(name: "gardening"),
              SingleItem(name: "healer"),
              SingleItem(name: "knitting"),
              SingleItem(name: "languageLearning"),
              SingleItem(name: "listingToMusic"),
              SingleItem(name: "memoryGames"),
              SingleItem(name: "mindfulness"),
              SingleItem(name: "natureExploration"),
              SingleItem(name: "outdoorActivities"),
              SingleItem(name: "painting"),
              SingleItem(name: "petTherapy"),
              SingleItem(name: "physicalActivity"),
              SingleItem(name: "playAnInstrument"),
              SingleItem(name: "puzzleGames"),
              SingleItem(name: "readingClub"),
              SingleItem(name: "relaxationExercises"),
              SingleItem(name: "singingAlone"),
              SingleItem(name: "socialActivities"),
              SingleItem(name: "storytelling"),
              SingleItem(name: "taiChi"),
              SingleItem(name: "yoga"),
            ],
          ),
        ),
      ],
    );
  }
}

class SingleItem extends StatelessWidget {
  const SingleItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      // buildWhen: (previous, current) =>
      //     previous.preferences.length != current.preferences.length,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: stateP.preferences.contains(name.tr())
                  ? () => contextP
                      .read<ProfileCubit>()
                      .removePreferencesSelection(name.tr())
                  : () => contextP
                      .read<ProfileCubit>()
                      .addPreferencesSelection(name.tr()),
              style: ElevatedButton.styleFrom(
                disabledBackgroundColor: stateP.preferences.contains(name.tr())
                    ? (state.user.role == "CG" ? mainBlue : mainOrange)
                    : white,
                backgroundColor: stateP.preferences.contains(name.tr())
                    ? (state.user.role == "CG" ? mainBlue : mainOrange)
                    : white,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: (state.user.role == "CG" ? mainBlue : mainOrange),
                      width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              child: SizedBox(
                height: 40.0,
                // width: 110.0.w,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomText(
                    text: name.tr().toUpperCase(),
                    fontSize: 16.0,
                    color: stateP.preferences.contains(name.tr())
                        ? white
                        : (state.user.role == "CG" ? mainBlue : mainOrange),
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
