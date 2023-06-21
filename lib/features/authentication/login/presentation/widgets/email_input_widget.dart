import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/authentication/login/cubit/login_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextFormField(
          hintText: "email".tr(),
          borderColor: mainColor,
          key: const Key("login_form_email_input_field"),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          errorText: state.email.isNotValid && state.email.value != ""
              ? "Please enter a valid email"
              : null,
        );
      },
    );
  }
}
