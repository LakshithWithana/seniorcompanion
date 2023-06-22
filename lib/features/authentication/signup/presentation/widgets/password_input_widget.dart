import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/authentication/signup/cubit/signup_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextFormField(
          key: const Key("signup_form_password_input_field"),
          keyboardType: TextInputType.visiblePassword,
          secure: isSecure,
          hintText: "password".tr(),
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
          errorText: state.password.isNotValid && state.password.value != ""
              ? "Password is not valid"
              : null,
          onChanged: (password) =>
              context.read<SignupCubit>().passwordChanged(password),
        );
      },
    );
  }
}
