import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/features/authentication/signup/cubit/signup_cubit.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/widgets/confirm_password_widget.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/widgets/email_input_widget.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/widgets/password_input_widget.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/widgets/role_selecter_widget.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/widgets/signup_button_widget.dart';

import '../../../../../core/constants/colors.dart';
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
          centerTitle: false,
          title: CustomText(
            text: "signup".tr().toUpperCase(),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        padding: const EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: mainColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: SizedBox(
                        height: 50.0,
                        width: 170.0.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/facebook_icon.png"),
                              const SizedBox(width: 5.0),
                              CustomText(
                                text: "facebook".tr().toUpperCase(),
                                fontSize: 16.0,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        padding: const EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: mainColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: SizedBox(
                        height: 50.0,
                        width: 170.0.w,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/google_icon.png"),
                              const SizedBox(width: 5.0),
                              CustomText(
                                text: "google".tr().toUpperCase(),
                                fontSize: 16.0,
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
