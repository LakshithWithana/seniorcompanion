import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/shared/widgets/custom_elevated_buttons.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          (previous.status != current.status) ||
          (previous.validated != current.validated),
      builder: (context, state) {
        return (state.status == FormzSubmissionStatus.inProgress ||
                state.status == FormzSubmissionStatus.success)
            ? const Center(child: CircularProgressIndicator())
            : CustomElevatedButton(
                key: const Key("profile_page_save_button"),
                backgroundColor: mainBlue,
                label: "save".tr(),
                onPressed: state.validated
                    ? () => context.read<ProfileCubit>().updateUserProfileData()
                    : null,
              );
      },
    );
  }
}
