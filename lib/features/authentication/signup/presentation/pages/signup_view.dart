import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/cubit/signup_cubit.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/apple_signup_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/confirm_password_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/email_input_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/facebook_signup_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/google_signup_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/password_input_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/role_selecter_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/widgets/signup_button_widget.dart';
import '../../../../../core/shared/widgets/custom_text.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) async {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Signup Failed"),
              ),
            );
        } else if (state.status == FormzSubmissionStatus.success) {
          await Future.delayed(const Duration(milliseconds: 5000));
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Theme.of(context).shadowColor,
          centerTitle: false,
          title: CustomText(
            text: "signup".tr().toUpperCase(),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailInputWidget(),
                      PasswordInputWidget(),
                      ConfirmPasswordInputWidget(),
                      SizedBox(height: 5.0),
                      RoleSelecterWidget(),
                      SizedBox(height: 40.0),
                      SignupButtonWidget(),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Column(
                    children: [
                      const FacebookSignupButtonWidget(),
                      const SizedBox(height: 20.0),
                      const GoogleSignupButtonWidget(),
                      const SizedBox(height: 20.0),
                      Platform.isIOS
                          ? const AppleSignupButtonWidget()
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
