import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/authentication/signup/cubit/signup_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class ConfirmPasswordInputWidget extends StatefulWidget {
  const ConfirmPasswordInputWidget({super.key});

  @override
  State<ConfirmPasswordInputWidget> createState() =>
      _ConfirmPasswordInputWidgetState();
}

class _ConfirmPasswordInputWidgetState
    extends State<ConfirmPasswordInputWidget> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return CustomTextFormField(
          roleType: RoleType.general,
          key: const Key("signup_form_password_input_field"),
          keyboardType: TextInputType.visiblePassword,
          secure: isSecure,
          hintText: "confirmPassword".tr(),
          borderColor: mainColor,
          suffix: IconButton(
            onPressed: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
            icon: isSecure
                ? const Icon(
                    Icons.visibility,
                    color: mainColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: mainColor,
                  ),
          ),
          errorText: state.confirmPassword.isNotValid &&
                  state.confirmPassword.value != ""
              ? "Password is not valid"
              : (state.confirmPassword.value != state.password.value &&
                      state.confirmPassword.value != "")
                  ? "Confirm Password not matched"
                  : null,
          onChanged: (confirmPassword) => context
              .read<SignupCubit>()
              .confirmPasswordChanged(confirmPassword),
        );
      },
    );
  }
}
