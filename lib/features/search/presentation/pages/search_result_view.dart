import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';
import 'package:newseniiorcompaniion/features/search/presentation/pages/single_search_result_view.dart';
import 'package:newseniiorcompaniion/features/search/presentation/widgets/search_result_page/rating_stars.dart';

import '../../../../core/shared/widgets/custom_text.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            title: CustomText(
              text: "searchResults".tr().toUpperCase(),
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: ListView.builder(
              itemCount: state.searchResult!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: mainColor, width: 2.0)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<SearchCubit>(context),
                            child: SingleSearchResultView(index: index),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                              state.searchResult![index].profilePicURL),
                        ),
                        title: CustomText(
                          text:
                              "${state.searchResult![index].firstName} ${state.searchResult![index].lastName}",
                          fontSize: 20.0,
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
                                  fontSize: 18.0,
                                  color: secondaryFontColor,
                                  fontWeight: FontWeight.normal,
                                ),
                                CustomText(
                                  text: state.searchResult![index].gender
                                      .toUpperCase(),
                                  fontSize: 18.0,
                                  color: secondaryFontColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: "${state.searchResult![index].rating}",
                                  fontSize: 16.0,
                                ),
                                CustomText(
                                  text: "/5.0",
                                  fontSize: 14.0,
                                  color: secondaryFontColor,
                                ),
                                const SizedBox(width: 10.0),
                                RatingStars(
                                    ratingScroe:
                                        state.searchResult![index].rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
