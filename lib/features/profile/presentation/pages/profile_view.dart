import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/about_input_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/birthday_input_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/first_name_input_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/gender_selection_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/last_name_input_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/preferences_selecter_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/profile_picture_widget.dart';
import 'package:newseniiorcompaniion/features/profile/presentation/widgets/save_button_widget.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool splashed = true;
  bool splashVisible = true;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    // Move the delayed operations to initState
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Check if widget is still mounted
        setState(() {
          splashed = false;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Check if widget is still mounted
        setState(() {
          splashVisible = false;
        });
      }
    });

    context.read<ProfileCubit>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.status == FormzSubmissionStatus.failure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                        state.errorMessage ?? "User Details Updation Failed"),
                  ),
                );
            }
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.userDetails.email != "") {
                return Scaffold(
                  appBar: AppBar(
                    shadowColor: Theme.of(context).shadowColor,
                    centerTitle: false,
                    title: CustomText(
                      text: "profile".tr().toUpperCase(),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Stepper(
                      currentStep: _index,
                      type: StepperType.horizontal,
                      stepIconBuilder: (stepIndex, stepState) {
                        return Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            color:
                                stepIndex == _index ? mainColor : Colors.grey,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child:
                              Center(child: Text((stepIndex + 1).toString())),
                        );
                      },
                      onStepCancel: () {
                        if (_index > 0) {
                          setState(() {
                            _index -= 1;
                          });
                        }
                      },
                      onStepContinue: () {
                        if (_index <= 4) {
                          setState(() {
                            _index += 1;
                          });
                        }
                      },
                      onStepTapped: (int index) {
                        setState(() {
                          _index = index;
                        });
                      },
                      steps: <Step>[
                        Step(
                          title: _index != 0
                              ? const SizedBox.shrink()
                              : const Text('Name'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Enter your name to continue.",
                                fontSize: 16.0,
                              ),
                              const SizedBox(height: 20.0),
                              FirstNameInputWidget(
                                  firstName: state.userDetails.firstName),
                              LastNameInputWidget(
                                  lastName: state.userDetails.lastName),
                              const Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "This will be shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Step(
                          title: _index != 1
                              ? const SizedBox.shrink()
                              : const Text('Birthday'),
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Enter your birthday to continue.",
                                fontSize: 16.0,
                              ),
                              SizedBox(height: 20.0),
                              BirthdayInputWidget(),
                              Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "Age is calculated and shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Step(
                          title: _index != 2
                              ? const SizedBox.shrink()
                              : const Text('Gender'),
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Enter your gender to continue.",
                                fontSize: 16.0,
                              ),
                              SizedBox(height: 20.0),
                              GenderSelecterWidget(),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "This is shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Step(
                          title: _index != 3
                              ? const SizedBox.shrink()
                              : const Text('About'),
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Enter about you to continue.",
                                fontSize: 16.0,
                              ),
                              SizedBox(height: 20.0),
                              AboutInputWidget(),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "This will be shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Step(
                          title: _index != 4
                              ? const SizedBox.shrink()
                              : const Text('Profile Picture'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Add your profile picture to continue.",
                                fontSize: 16.0,
                              ),
                              const SizedBox(height: 20.0),
                              ProfilePictureWidget(
                                  profilePicUrl:
                                      state.userDetails.profilePicURL),
                              const SizedBox(height: 20.0),
                              const Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "This will be shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                        Step(
                          title: _index != 5
                              ? const SizedBox.shrink()
                              : const Text('Preferences'),
                          content: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Enter your preferences to continue.",
                                fontSize: 16.0,
                              ),
                              SizedBox(height: 20.0),
                              PreferencesSelecterWidget(),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Icon(Icons.visibility),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text: "This will be shown on your profile.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomText(
                                    text:
                                        "This will be shown to other users\nwhen you appear in their search results.",
                                    fontSize: 14.0,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ],
                      controlsBuilder: (context, details) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed:
                                  _index == 0 ? null : details.onStepCancel,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('BACK'),
                            ),
                            _index == 5
                                ? const SaveButtonWidget()
                                : ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'NEXT',
                                      style: TextStyle(
                                        color: white,
                                      ),
                                    ),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  // SingleChildScrollView(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             ProfilePictureWidget(
                  //                 profilePicUrl:
                  //                     state.userDetails.profilePicURL),
                  //             const SizedBox(height: 20.0),
                  //             FirstNameInputWidget(
                  //                 firstName: state.userDetails.firstName),
                  //             LastNameInputWidget(
                  //                 lastName: state.userDetails.lastName),
                  //             const BirthdayInputWidget(),
                  //             const AboutInputWidget(),
                  //             const GenderSelecterWidget(),
                  //             const SizedBox(height: 20.0),
                  //             const PreferencesSelecterWidget(),
                  //             const SizedBox(height: 40.0),
                  //             const SaveButtonWidget(),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                );
              } else {
                return const Scaffold(
                  body: CircularProgressIndicator(),
                );
              }
            },
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
