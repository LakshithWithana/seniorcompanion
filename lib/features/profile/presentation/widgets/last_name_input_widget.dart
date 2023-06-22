import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class LastNameInputWidget extends StatelessWidget {
  const LastNameInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return CustomTextFormField(
          hintText: "lastName".tr(),
          borderColor: mainColor,
          key: const Key("profile_form_lastName_input_field"),
          onChanged: (lastName) =>
              context.read<ProfileCubit>().lastNameChanged(lastName),
          keyboardType: TextInputType.name,
          errorText: state.lastName.isNotValid && state.lastName.value != ""
              ? "Please enter your Last Name"
              : null,
        );
      },
    );
  }
}
