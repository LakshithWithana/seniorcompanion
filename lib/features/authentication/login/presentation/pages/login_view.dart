import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:seniorcompanion/features/authentication/login/cubit/login_cubit.dart';
import 'package:seniorcompanion/features/authentication/login/presentation/widgets/email_input_widget.dart';
import 'package:seniorcompanion/features/authentication/login/presentation/widgets/login_button_widget.dart';
import 'package:seniorcompanion/features/authentication/login/presentation/widgets/password_input_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Authentication Failed"),
              ),
            );
        }
        // else if (state.status == FormzSubmissionStatus.success) {}
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: CustomText(
            text: "login".tr().toUpperCase(),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EmailInputWidget(),
                    const PasswordInputWidget(),
                    const SizedBox(height: 5.0),
                    InkWell(
                      onTap: () {},
                      child: CustomText(
                        text: "forgotPassword?".tr(),
                        fontSize: 20.0,
                        color: mainColor,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const LoginButtonWidget(),
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
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: mainColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: SizedBox(
                        height: 50.0,
                        width: 122.0.w,
                        child: Center(
                          child: Row(
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
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: mainColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: SizedBox(
                        height: 50.0,
                        width: 122.0.w,
                        child: Center(
                          child: Row(
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
                const SizedBox(height: 80.0),
                CustomElevatedButton(
                  isNegative: true,
                  backgroundColor: mainColor,
                  label: "signup".tr(),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
