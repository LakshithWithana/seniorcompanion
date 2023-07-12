import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/core/loacation/bloc/location_bloc.dart';
import 'package:seniorcompanion/core/loacation/data/repository/location_repository.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/features/search/cubit/search_cubit.dart';
import 'package:seniorcompanion/features/search/data/repository/search_repository.dart';
import 'package:seniorcompanion/features/search/presentation/pages/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static Page page() => const MaterialPage<void>(child: SearchPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LocationBloc(locationRepository: locator<LocationRepository>()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            searchRepository: locator<SearchRepository>(),
          ),
        ),
      ],
      child: const SearchView(),
    );
  }
}
