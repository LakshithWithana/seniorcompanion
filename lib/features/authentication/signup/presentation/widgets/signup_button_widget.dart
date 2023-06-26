import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/features/authentication/signup/cubit/signup_cubit.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_elevated_buttons.dart';

class SignupButtonWidget extends StatelessWidget {
  const SignupButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          (previous.status != current.status) || (current.validated == true),
      builder: (context, state) {
        return (state.status == FormzSubmissionStatus.inProgress ||
                state.status == FormzSubmissionStatus.success)
            ? const Center(child: CircularProgressIndicator())
            : CustomElevatedButton(
                key: const Key("signup_form_signup_button"),
                backgroundColor: mainColor,
                label: "signup".tr(),
                onPressed: state.validated
                    ? () {
                        context
                            .read<SignupCubit>()
                            .registerWithEmailAndPassword();
                      }
                    : null,
              );
      },
    );
  }
}
