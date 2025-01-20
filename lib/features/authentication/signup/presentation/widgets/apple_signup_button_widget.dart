import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/cubit/signup_cubit.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';

class AppleSignupButtonWidget extends StatelessWidget {
  const AppleSignupButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => (previous.status != current.status),
      builder: (context, state) {
        return
            // (state.status == FormzSubmissionStatus.inProgress ||
            //         state.status == FormzSubmissionStatus.success)
            //     ? const Center(child: CircularProgressIndicator())
            //     :
            ElevatedButton(
          onPressed: () => context.read<SignupCubit>().registerWithApple(),
          style: ElevatedButton.styleFrom(
            backgroundColor: white,
            padding: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: mainColor, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 50.0,
              maxWidth: 353.0,
            ),
            // width: 170.0.w,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset("assets/images/apple-logo.png"),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: CustomText(
                      text: "apple".tr().toUpperCase(),
                      fontSize: 16.0,
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
