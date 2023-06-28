import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_date_picker.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';

class BirthdayInputWidget extends StatelessWidget {
  const BirthdayInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return CustomDatePicker(
          hintText: "birthday".tr(),
          borderColor: mainOrange,
          key: const Key("profile_form_birthday_input_field"),
          onChanged: (birthday) =>
              context.read<ProfileCubit>().birthdayChanged(birthday.toString()),
          keyboardType: TextInputType.none,
          errorText: !state.validated ? "Please enter your Birthday" : null,
        );
      },
    );
  }
}
