import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newseniiorcompaniion/features/authentication/login/cubit/login_cubit.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/widgets/apple_login_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/widgets/email_input_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/widgets/facebook_login_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/widgets/login_button_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/widgets/password_input_widget.dart';
import 'package:newseniiorcompaniion/features/authentication/signup/presentation/pages/signup_page.dart';
import 'dart:io' show Platform;
import '../widgets/google_login_button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool splashed = true;
  bool splashVisible = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        splashed = false;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        splashVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? "Login Failed"),
                  ),
                );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              shadowColor: Theme.of(context).shadowColor,
              centerTitle: false,
              title: CustomText(
                text: "login".tr().toUpperCase(),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const EmailInputWidget(),
                          const PasswordInputWidget(),
                          const SizedBox(height: 5.0),
                          InkWell(
                            onTap: () {},
                            child: CustomText(
                              text: "forgotPassword?".tr(),
                              fontSize: 16.0,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          const LoginButtonWidget(),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      Column(
                        children: [
                          const FacebookLoginButtonWidget(),
                          const SizedBox(height: 10.0),
                          const GoogleLoginButtonWidget(),
                          const SizedBox(height: 10.0),
                          Platform.isIOS
                              ? const AppleLoginButtonWidget()
                              : const SizedBox(),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      CustomElevatedButton(
                        isNegative: true,
                        backgroundColor: mainColor,
                        label: "signup".tr(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        splashVisible
            ? AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: splashed ? 1 : 0,
                child: Container(
                  color: mainColor,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.0.w),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
