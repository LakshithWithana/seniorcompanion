import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../cubit/settings_cubit.dart';

class LastNameInputWidget extends StatelessWidget {
  const LastNameInputWidget(
      {super.key,
      required this.lastName,
      required this.firstName,
      required this.about});
  final String firstName;
  final String lastName;
  final String about;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: lastName,
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "lastName".tr(),
              borderColor: mainColor,
              key: const Key("settings_form_lastName_input_field"),
              onChanged: (value) => contextP
                  .read<SettingsCubit>()
                  .lastNameChanged(value, lastName, firstName, about),
              keyboardType: TextInputType.name,
              errorText:
                  stateP.lastName.isNotValid && stateP.lastName.value != ""
                      ? "Please enter your Last Name"
                      : null,
            );
          },
        );
      },
    );
  }
}
