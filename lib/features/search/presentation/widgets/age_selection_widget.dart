import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/features/search/cubit/search_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class AgeSelectionWidget extends StatelessWidget {
  const AgeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              key: const Key("search_form_age_selecter"),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "age".tr().toUpperCase(),
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "min".tr().toUpperCase(),
                      fontSize: 16.0,
                      color: secondaryFontColor,
                    ),
                    CustomText(
                      text: "max".tr().toUpperCase(),
                      fontSize: 16.0,
                      color: secondaryFontColor,
                    ),
                  ],
                ),
                RangeSlider(
                  activeColor: state.user.role == "CG" ? mainBlue : mainOrange,
                  values: RangeValues(double.parse(stateP.startAge.toString()),
                      double.parse(stateP.endAge.toString())),
                  min: 20.0,
                  max: 70.0,
                  onChanged: (RangeValues values) {
                    contextP.read<SearchCubit>().startAgeChanged(values.start);
                    contextP.read<SearchCubit>().endAgeChanged(values.end);
                  },
                  labels: RangeLabels(
                      stateP.startAge.toString(), stateP.endAge.toString()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.0,
                      width: 118.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                state.user.role == "CG" ? mainBlue : mainOrange,
                            width: 2.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: stateP.startAge.toString(),
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CustomText(
                      text: "to".tr().toUpperCase(),
                      fontSize: 16.0,
                      color: secondaryFontColor,
                    ),
                    Container(
                      height: 50.0,
                      width: 118.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                state.user.role == "CG" ? mainBlue : mainOrange,
                            width: 2.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: stateP.endAge.toString(),
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold,
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
