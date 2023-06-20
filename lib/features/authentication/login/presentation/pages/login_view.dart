import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isSecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hintText: "email".tr(),
                      borderColor: mainColor,
                    ),
                    CustomTextFormField(
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
                                )),
                    ),
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
                    CustomElevatedButton(
                      backgroundColor: mainColor,
                      label: "login".tr(),
                      onPressed: () {},
                    ),
                  ],
                ),
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
    );
  }
}
