import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/features/search/cubit/search_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../widgets/search_result_page/rating_stars.dart';

class SingleSearchResultView extends StatelessWidget {
  const SingleSearchResultView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: CustomText(
              text:
                  "${state.searchResult![index].firstName} ${state.searchResult![index].lastName}",
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          state.searchResult![index].profilePicURL),
                    ),
                    title: CustomText(
                      text:
                          "${state.searchResult![index].firstName} ${state.searchResult![index].lastName}",
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text:
                                  "${state.searchResult![index].age} Years - ",
                              fontSize: 18.0.sp,
                              color: secondaryFontColor,
                              fontWeight: FontWeight.normal,
                            ),
                            CustomText(
                              text: state.searchResult![index].gender
                                  .toUpperCase(),
                              fontSize: 18.0.sp,
                              color: secondaryFontColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: "${state.searchResult![index].rating}",
                              fontSize: 16.0.sp,
                            ),
                            CustomText(
                              text: "/5.0",
                              fontSize: 14.0.sp,
                              color: secondaryFontColor,
                            ),
                            const SizedBox(width: 10.0),
                            RatingStars(
                                ratingScroe: state.searchResult![index].rating),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  CustomText(
                    text: "about".tr().toUpperCase(),
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: state.searchResult![index].about,
                    fontSize: 16.0.sp,
                    textAlignment: TextAlign.justify,
                  ),
                  const SizedBox(height: 15.0),
                  CustomText(
                    text: "preferences".tr().toUpperCase(),
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.searchResult![index].preferences.length,
                    itemBuilder: (BuildContext context, int listIndex) {
                      return BlocBuilder<AppBloc, AppState>(
                        builder: (contextP, stateP) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: stateP.user.role == "CG"
                                        ? mainBlue
                                        : mainOrange,
                                    border: Border.all(
                                      color: (stateP.user.role == "CG"
                                          ? mainBlue
                                          : mainOrange),
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: state.searchResult![index]
                                        .preferences[listIndex],
                                    fontSize: 18.0.sp,
                                    color: white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
