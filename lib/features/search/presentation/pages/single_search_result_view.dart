import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/search/cubit/search_cubit.dart';

import '../../../../core/shared/widgets/custom_text.dart';

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
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
