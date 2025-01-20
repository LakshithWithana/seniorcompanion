import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/core/loacation/bloc/location_bloc.dart';
import 'package:newseniiorcompaniion/features/search/cubit/search_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_elevated_buttons.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => (previous.status != current.status),
      builder: (contextP, stateP) {
        return (stateP.status == FormzSubmissionStatus.inProgress)
            ? const Center(child: CircularProgressIndicator())
            : BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Center(
                    child: CustomElevatedButton(
                      key: const Key("search_page_search_button"),
                      backgroundColor:
                          (state.user.role == "CG" ? mainBlue : mainOrange),
                      label: "search".tr(),
                      onPressed: () async {
                        locationBloc.add(const LocationEvent.started());
                        contextP
                            .read<SearchCubit>()
                            .searchUser(state.user.role);
                      },
                    ),
                  );
                },
              );
      },
    );
  }
}
