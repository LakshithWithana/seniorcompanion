import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

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
        const Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          children: [
            SingleItem(name: "artLover"),
            SingleItem(name: "adviser"),
            SingleItem(name: "aide"),
            SingleItem(name: "bookWarm"),
            SingleItem(name: "boardGamer"),
            SingleItem(name: "buddy"),
            SingleItem(name: "cleaner"),
            SingleItem(name: "companion"),
            SingleItem(name: "communicator"),
            SingleItem(name: "cook"),
            SingleItem(name: "confidente"),
            SingleItem(name: "custodian"),
            SingleItem(name: "driver"),
            SingleItem(name: "friend"),
            SingleItem(name: "filmFanatic"),
            SingleItem(name: "guide"),
            SingleItem(name: "hangout"),
            SingleItem(name: "healer"),
            SingleItem(name: "helper"),
            SingleItem(name: "houseSitter"),
            SingleItem(name: "instructor"),
            SingleItem(name: "nurse"),
            SingleItem(name: "psychoTherapist"),
            SingleItem(name: "sidekick"),
            SingleItem(name: "sportsLover"),
            SingleItem(name: "therapist"),
            SingleItem(name: "trainer"),
            SingleItem(name: "traveller"),
          ],
        ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "artLover"),
        //     SingleItem(name: "adviser"),
        //     SingleItem(name: "aide"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "bookWarm"),
        //     SingleItem(name: "boardGamer"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "buddy"),
        //     SingleItem(name: "cleaner"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "companion"),
        //     SingleItem(name: "communicator"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "cook"),
        //     SingleItem(name: "confidente"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "custodian"),
        //     SingleItem(name: "driver"),
        //     SingleItem(name: "friend"),
        //     // SingleItem(name: "filmFanatic")
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "filmFanatic"),
        //     SingleItem(name: "guide"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "hangout"),
        //     SingleItem(name: "healer"),
        //     SingleItem(name: "helper"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "houseSitter"),
        //     SingleItem(name: "instructor"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "nurse"),
        //     SingleItem(name: "psychoTherapist"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "sidekick"),
        //     SingleItem(name: "sportsLover"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "therapist"),
        //     SingleItem(name: "trainer"),
        //   ],
        // ),
        // const Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SingleItem(name: "traveller"),
        //   ],
        // ),
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
                    fontSize: 16.0.sp,
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
