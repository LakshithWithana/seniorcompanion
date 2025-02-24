import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/features/profile/cubit/profile_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';
import '../../../../app/bloc/app_bloc.dart';

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
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
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
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    // maxHeight: 50.0,
                    maxWidth: 353.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => contextP
                            .read<ProfileCubit>()
                            .genderChanged("female"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: stateP.gender == "female"
                              ? (state.user.role == "CG"
                                  ? mainBlue
                                  : mainOrange)
                              : white,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: state.user.role == "CG"
                                    ? mainBlue
                                    : mainOrange,
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        child: SizedBox(
                          height: 50.0,
                          width: 110.0,
                          child: Center(
                            child: CustomText(
                              text: "female".tr().toUpperCase(),
                              fontSize: 16.0,
                              color: stateP.gender == "female"
                                  ? white
                                  : (state.user.role == "CG"
                                      ? mainBlue
                                      : mainOrange),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            contextP.read<ProfileCubit>().genderChanged("male"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: stateP.gender == "male"
                              ? (state.user.role == "CG"
                                  ? mainBlue
                                  : mainOrange)
                              : white,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: (state.user.role == "CG"
                                    ? mainBlue
                                    : mainOrange),
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        child: SizedBox(
                          height: 50.0,
                          width: 110.0,
                          child: Center(
                            child: CustomText(
                              text: "male".tr().toUpperCase(),
                              fontSize: 16.0,
                              color: stateP.gender == "male"
                                  ? white
                                  : (state.user.role == "CG"
                                      ? mainBlue
                                      : mainOrange),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => contextP
                            .read<ProfileCubit>()
                            .genderChanged("other"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: stateP.gender == "other"
                              ? (state.user.role == "CG"
                                  ? mainBlue
                                  : mainOrange)
                              : white,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: (state.user.role == "CG"
                                    ? mainBlue
                                    : mainOrange),
                                width: 2.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        child: SizedBox(
                          height: 50.0,
                          width: 110.0,
                          child: Center(
                            child: CustomText(
                              text: "other".tr().toUpperCase(),
                              fontSize: 16.0,
                              color: stateP.gender == "other"
                                  ? white
                                  : (state.user.role == "CG"
                                      ? mainBlue
                                      : mainOrange),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
