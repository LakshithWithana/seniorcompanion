import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';

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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "artLover"),
            SingleItem(name: "adviser"),
            SingleItem(name: "aide"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "bookWarm"),
            SingleItem(name: "boardGamer"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "buddy"),
            SingleItem(name: "cleaner"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "companion"),
            SingleItem(name: "communicator"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "cook"),
            SingleItem(name: "confidente"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "custodian"),
            SingleItem(name: "driver"),
            SingleItem(name: "friend"),
            // SingleItem(name: "filmFanatic")
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "filmFanatic"),
            SingleItem(name: "guide"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "hangout"),
            SingleItem(name: "healer"),
            SingleItem(name: "helper"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "houseSitter"),
            SingleItem(name: "instructor"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "nurse"),
            SingleItem(name: "psychoTherapist"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "sidekick"),
            SingleItem(name: "sportsLover"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "therapist"),
            SingleItem(name: "trainer"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleItem(name: "traveller"),
          ],
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
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.preferences.contains(name.tr())
              ? null
              : () => context
                  .read<ProfileCubit>()
                  .addPreferencesSelection(name.tr()),
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor:
                state.preferences.contains(name.tr()) ? mainBlue : white,
            backgroundColor:
                state.preferences.contains(name.tr()) ? mainBlue : white,
            padding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: mainBlue, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                      color: state.preferences.contains(name.tr())
                          ? white
                          : mainBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 5.0),
                    state.preferences.contains(name.tr())
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<ProfileCubit>()
                                  .removePreferencesSelection(name.tr());
                            },
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.red,
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
  }
}
