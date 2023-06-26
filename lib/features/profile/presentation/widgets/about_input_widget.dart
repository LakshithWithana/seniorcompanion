import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class AboutInputWidget extends StatelessWidget {
  const AboutInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.about != current.about,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "about".tr(),
              borderColor: mainColor,
              key: const Key("profile_form_about_input_field"),
              onChanged: (about) =>
                  contextP.read<ProfileCubit>().aboutChanged(about),
              keyboardType: TextInputType.text,
              errorText: stateP.about.isNotValid && stateP.about.value != ""
                  ? "Please type a sentence described yourself"
                  : null,
            );
          },
        );
      },
    );
  }
}
