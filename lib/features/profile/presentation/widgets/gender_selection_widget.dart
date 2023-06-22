import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';

class GenderSelecterWidget extends StatefulWidget {
  const GenderSelecterWidget({super.key});

  @override
  State<GenderSelecterWidget> createState() => _GenderSelecterWidgetState();
}

class _GenderSelecterWidgetState extends State<GenderSelecterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return Column(
          key: const Key("profile_form_gender_selecter"),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "gender".tr().toUpperCase(),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<ProfileCubit>().genderChanged("female"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        state.gender == "female" ? mainBlue : white,
                    padding: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: mainBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: SizedBox(
                    height: 50.0,
                    width: 110.0.w,
                    child: Center(
                      child: CustomText(
                        text: "female".tr().toUpperCase(),
                        fontSize: 16.0,
                        color: state.gender == "female" ? white : mainBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<ProfileCubit>().genderChanged("male"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.gender == "male" ? mainBlue : white,
                    padding: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: mainBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: SizedBox(
                    height: 50.0,
                    width: 110.0.w,
                    child: Center(
                      child: CustomText(
                        text: "male".tr().toUpperCase(),
                        fontSize: 16.0,
                        color: state.gender == "male" ? white : mainBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<ProfileCubit>().genderChanged("other"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.gender == "other" ? mainBlue : white,
                    padding: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: mainBlue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  child: SizedBox(
                    height: 50.0,
                    width: 110.0.w,
                    child: Center(
                      child: CustomText(
                        text: "other".tr().toUpperCase(),
                        fontSize: 16.0,
                        color: state.gender == "other" ? white : mainBlue,
                        fontWeight: FontWeight.bold,
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
