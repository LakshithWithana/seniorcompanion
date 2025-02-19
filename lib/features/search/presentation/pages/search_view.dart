import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/service_locator/service_locator.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_text.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/divider_widget.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';
import 'package:newseniiorcompaniion/features/search/presentation/pages/search_result_view.dart';
import 'package:newseniiorcompaniion/features/search/presentation/widgets/age_selection_widget.dart';
import 'package:newseniiorcompaniion/features/search/presentation/widgets/distance_selection_widget.dart';
import 'package:newseniiorcompaniion/features/search/presentation/widgets/search_button_widget.dart';

import '../widgets/gender_selection_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = locator<AuthRepository>();
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          if (state.searchResult != null && state.searchResult!.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<SearchCubit>(context),
                  child: const SearchResultView(),
                ),
              ),
            );
          } else {
            // Only show snackbar when submission is successful but no results found
            final message = authRepository.currentUser.role == "CG"
                ? "No Care Recievers are near you! Try again in a bit"
                : "No Care Givers are near you! Try again in a bit";

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar() // Hide any existing snackbar
              ..showSnackBar(SnackBar(
                backgroundColor: Colors.amber,
                content: Text(
                  message,
                  style: const TextStyle(color: black),
                ),
              ));
          }
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              authRepository.currentUser.role == "CG"
                  ? CustomText(
                      text: "iAmLookingForACareRecipient".tr().toUpperCase(),
                      fontSize: 18.0)
                  : CustomText(
                      text: "iAmLookingForACaregiver".tr().toUpperCase(),
                      fontSize: 18.0),
              const SizedBox(height: 20.0),
              const GenderSelctionWidget(),
              const DividerWidget(),
              const AgeSelectionWidget(),
              const DividerWidget(),
              const DistanceSelectionWidget(),
              const DividerWidget(),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     CustomText(
              //       text: "time".tr().toUpperCase(),
              //       fontSize: 16.0.sp,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CustomText(
              //           text: "from".tr().toUpperCase(),
              //           fontSize: 16.0,
              //           color: secondaryFontColor,
              //         ),
              //         CustomText(
              //           text: "to".tr().toUpperCase(),
              //           fontSize: 16.0,
              //           color: secondaryFontColor,
              //         ),
              //       ],
              //     ),
              //     RangeSlider(
              //       activeColor: mainBlue,
              //       values: const RangeValues(20, 70),
              //       min: 20,
              //       max: 70,
              //       onChanged: (RangeValues values) {
              //         // setState(() {
              //         //   _currentRangeValues = values;
              //         // });
              //       },
              //       labels: RangeLabels(20.toString(), 70.toString()),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           height: 50.0,
              //           width: 118.0,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: mainBlue, width: 2.0),
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //         ),
              //         CustomText(
              //           text: "to".tr().toUpperCase(),
              //           fontSize: 16.0,
              //           color: secondaryFontColor,
              //         ),
              //         Container(
              //           height: 50.0,
              //           width: 118.0,
              //           decoration: BoxDecoration(
              //             border: Border.all(color: mainBlue, width: 2.0),
              //             borderRadius:
              //                 const BorderRadius.all(Radius.circular(10.0)),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              const SearchButtonWidget(),
              // const SearchList(),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     authRepository.signOutUser();
              //   },
              //   child: const Text("Logout"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
