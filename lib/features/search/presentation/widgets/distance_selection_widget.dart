import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class DistanceSelectionWidget extends StatelessWidget {
  const DistanceSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              key: const Key("search_form_distance_selecter"),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "distance".tr().toUpperCase(),
                  fontSize: 16.0,
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
                Slider(
                  activeColor: state.user.role == "CG" ? mainBlue : mainOrange,
                  value: stateP.distance.toDouble(),
                  min: 1,
                  max: 100,
                  label: stateP.distance.toString(),
                  onChanged: (double value) {
                    contextP.read<SearchCubit>().distanceChanged(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "searchingRadius".tr().toUpperCase(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: stateP.distance.toString(),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: " KM",
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: secondaryFontColor,
                            ),
                          ],
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
