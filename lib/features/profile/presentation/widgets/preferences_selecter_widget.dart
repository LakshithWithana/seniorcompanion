import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';

class PreferencesSelecterWidget extends StatelessWidget {
  const PreferencesSelecterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          previous.preferences != current.preferences,
      builder: (context, state) {
        return Column(
          key: const Key("profile_form_preferences_selecter"),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "preferences".tr().toUpperCase(),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: state.preferences.contains("artLover".tr())
                      ? null
                      : () => context
                          .read<ProfileCubit>()
                          .preferencesSelection("artLover".tr()),
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor:
                        state.preferences.contains("artLover".tr())
                            ? mainBlue
                            : white,
                    backgroundColor: state.preferences.contains("artLover".tr())
                        ? mainBlue
                        : white,
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
                              text: "artLover".tr().toUpperCase(),
                              fontSize: 16.0,
                              color: state.preferences.contains("artLover".tr())
                                  ? white
                                  : mainBlue,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 5.0),
                            state.preferences.contains("artLover".tr())
                                ? InkWell(
                                    onTap: () {},
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
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<ProfileCubit>()
                      .preferencesSelection("adviser".tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.preferences.contains("adviser".tr())
                        ? mainBlue
                        : white,
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
                        child: CustomText(
                          text: "adviser".tr().toUpperCase(),
                          fontSize: 16.0,
                          color: state.preferences.contains("adviser".tr())
                              ? white
                              : mainBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<ProfileCubit>()
                      .preferencesSelection("aide".tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.preferences.contains("aide".tr())
                        ? mainBlue
                        : white,
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
                        child: CustomText(
                          text: "aide".tr().toUpperCase(),
                          fontSize: 16.0,
                          color: state.preferences.contains("aide".tr())
                              ? white
                              : mainBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
