import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class FirstNameInputWidget extends StatelessWidget {
  const FirstNameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return CustomTextFormField(
          hintText: "firstName".tr(),
          borderColor: mainBlue,
          key: const Key("profile_form_firstName_input_field"),
          onChanged: (firstName) =>
              context.read<ProfileCubit>().firstNameChanged(firstName),
          keyboardType: TextInputType.name,
          errorText: state.firstName.isNotValid && state.firstName.value != ""
              ? "Please enter your First Name"
              : null,
        );
      },
    );
  }
}
