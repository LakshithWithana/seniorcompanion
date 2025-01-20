import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class GenderSelctionWidget extends StatelessWidget {
  const GenderSelctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              key: const Key("search_form_gender_selecter"),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "careRecipientGender".tr().toUpperCase(),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          contextP.read<SearchCubit>().genderChanged("anyone"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: stateP.gender == "anyone"
                            ? (state.user.role == "CG" ? mainBlue : mainOrange)
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
                        width: 110.0.w,
                        child: Center(
                          child: CustomText(
                            text: "anyone".tr().toUpperCase(),
                            fontSize: 16.0,
                            color: stateP.gender == "anyone"
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
                          contextP.read<SearchCubit>().genderChanged("female"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: stateP.gender == "female"
                            ? (state.user.role == "CG" ? mainBlue : mainOrange)
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
                        width: 110.0.w,
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
                          contextP.read<SearchCubit>().genderChanged("male"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: stateP.gender == "male"
                            ? (state.user.role == "CG" ? mainBlue : mainOrange)
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
                        width: 110.0.w,
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
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
