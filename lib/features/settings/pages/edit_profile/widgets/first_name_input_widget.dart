import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../cubit/settings_cubit.dart';

class FirstNameInputWidget extends StatelessWidget {
  const FirstNameInputWidget(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.about});
  final String firstName;
  final String lastName;
  final String about;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (contextP, stateP) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: firstName,
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "firstName".tr(),
              borderColor: mainBlue,
              key: const Key("settings_form_firstName_input_field"),
              onChanged: (value) {
                contextP
                    .read<SettingsCubit>()
                    .firstNameChanged(value, firstName, lastName, about);
              },
              keyboardType: TextInputType.name,
              errorText:
                  stateP.firstName.isNotValid && stateP.firstName.value != ""
                      ? "Please enter your First Name"
                      : null,
            );
          },
        );
      },
    );
  }
}
