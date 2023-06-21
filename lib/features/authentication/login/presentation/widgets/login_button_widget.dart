import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_elevated_buttons.dart';
import '../../cubit/login_cubit.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          (previous.status != current.status) ||
          (previous.validated != current.validated),
      builder: (context, state) {
        return (state.status == FormzSubmissionStatus.inProgress)
            ? const Center(child: CircularProgressIndicator())
            : CustomElevatedButton(
                key: const Key("login_form_login_button"),
                backgroundColor: mainColor,
                label: "login".tr(),
                onPressed: state.validated
                    ? () => context.read<LoginCubit>().loginWithCredentials()
                    : null,
              );
      },
    );
  }
}
