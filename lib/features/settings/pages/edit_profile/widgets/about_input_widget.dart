import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../cubit/settings_cubit.dart';

class AboutInputWidget extends StatelessWidget {
  const AboutInputWidget({super.key, required this.about});
  final String about;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.about != current.about,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: about,
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "about".tr(),
              borderColor: mainColor,
              key: const Key("profile_form_about_input_field"),
              onChanged: (about) =>
                  contextP.read<SettingsCubit>().aboutChanged(about),
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
