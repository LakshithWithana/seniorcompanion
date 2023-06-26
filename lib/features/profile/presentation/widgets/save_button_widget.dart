import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/shared/widgets/custom_elevated_buttons.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          (previous.status != current.status) ||
          (previous.validated != current.validated),
      builder: (contextP, stateP) {
        return (stateP.status == FormzSubmissionStatus.inProgress ||
                stateP.status == FormzSubmissionStatus.success)
            ? const Center(child: CircularProgressIndicator())
            : BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    key: const Key("profile_page_save_button"),
                    backgroundColor:
                        (state.user.role == "CG" ? mainBlue : mainOrange),
                    label: "save".tr(),
                    onPressed: stateP.validated
                        ? () => contextP
                            .read<ProfileCubit>()
                            .updateUserProfileData()
                        : null,
                  );
                },
              );
      },
    );
  }
}
