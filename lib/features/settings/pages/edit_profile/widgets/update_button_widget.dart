import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/features/settings/cubit/settings_cubit.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/shared/widgets/custom_elevated_buttons.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          (previous.validated != current.validated),
      builder: (contextP, stateP) {
        return
            // (stateP.status == FormzSubmissionStatus.inProgress ||
            //         stateP.status == FormzSubmissionStatus.success)
            //     ? const Center(child: CircularProgressIndicator())
            BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomElevatedButton(
              key: const Key("settings_page_update_button"),
              backgroundColor:
                  (state.user.role == "CG" ? mainBlue : mainOrange),
              label: "update".tr(),
              onPressed: stateP.validated
                  ? () => contextP.read<SettingsCubit>().updateUserProfileData()
                  : null,
            );
          },
        );
      },
    );
  }
}
