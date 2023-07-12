import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/search/cubit/search_cubit.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.searchResult != null) {
          return SizedBox(
            height: 100.0,
            child: ListView.builder(
              itemCount: state.searchResult!.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(state.searchResult![index].email);
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
