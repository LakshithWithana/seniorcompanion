import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/features/settings/cubit/settings_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class BirthdayInputWidget extends StatelessWidget {
  const BirthdayInputWidget({super.key, required this.birthday});
  final String birthday;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previousP, currentP) =>
          previousP.birthday != currentP.birthday,
      builder: (context, state) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              readOnly: true,
              initialValue: birthday.split(" ").first,
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "birthday".tr(),
              borderColor: mainBlue,
              key: const Key("settings_form_firstName_input_field"),
            );
          },
        );
        // CustomDatePicker(
        //   initialValue: birthday,
        //   hintText: "birthday".tr(),
        //   borderColor: mainOrange,
        //   key: const Key("profile_form_birthday_input_field"),
        //   onChanged: (birthday) =>
        //       context.read<ProfileCubit>().birthdayChanged(birthday.toString()),
        //   keyboardType: TextInputType.none,
        //   errorText: !state.validated ? "Please enter your Birthday" : null,
        // );
      },
    );
  }
}
