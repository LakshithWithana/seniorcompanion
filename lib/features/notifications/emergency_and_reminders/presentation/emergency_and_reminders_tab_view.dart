import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text.dart';
import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/cubit/emergency_cubit.dart';

import '../../../../core/shared/widgets/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class EmergencyAndRemindersTabView extends StatelessWidget {
  const EmergencyAndRemindersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmergencyCubit, EmergencyState>(
      listener: (context, state) {
        if (state.emergencyCallUpdated == true) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Emergency Call Number Updated!'),
              ),
            );
        }
        if (state.doctorCallUpdated == true) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Doctor Call Number Updated!'),
              ),
            );
        }
        if (state.ambulanceCallUpdated == true) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Emergency Call Number Updated!'),
              ),
            );
        }
      },
      child: BlocBuilder<EmergencyCubit, EmergencyState>(
        builder: (contextE, stateE) {
          contextE.read<EmergencyCubit>().getAmbulanceCallNo();
          contextE.read<EmergencyCubit>().getDoctorCallNo();
          contextE.read<EmergencyCubit>().getEmergencyCallNo();
          return Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      if (stateE.retrievedEmergencyNo.isEmpty) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: CustomText(
                                text: "Emergency Calling Number is not set!",
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              content: CustomText(
                                text:
                                    'You can enter the emergency call number in "Settings" or here.',
                                fontSize: 16.0.sp,
                              ),
                              actions: <Widget>[
                                CustomTextFormField(
                                  hintText: "emergencyCallNo".tr(),
                                  borderColor: mainColor,
                                  key: const Key(
                                      "notification_page_emergencyCallNo_input_field"),
                                  onChanged: (no) => contextE
                                      .read<EmergencyCubit>()
                                      .emergencyCallNoChanged(no),
                                  // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                                  keyboardType: TextInputType.number,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('CANCEL'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('SAVE'),
                                  onPressed: () {
                                    contextE
                                        .read<EmergencyCubit>()
                                        .updateEmergencyCallNo();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        UrlLauncher.launchUrl(
                            Uri.parse("tel://${stateE.retrievedEmergencyNo}"));
                      }
                    },
                    label: "Emergency Call",
                    backgroundColor: mainColor,
                  ),
                  const SizedBox(height: 15.0),
                  CustomElevatedButton(
                    onPressed: () {
                      if (stateE.retrievedDoctorNo.isEmpty) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: CustomText(
                                text: "Doctor's Calling Number is not set!",
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              content: CustomText(
                                text:
                                    'You can enter the doctor\'s call number in "Settings" or here.',
                                fontSize: 16.0.sp,
                              ),
                              actions: <Widget>[
                                CustomTextFormField(
                                  hintText: "doctorCallNo".tr(),
                                  borderColor: mainColor,
                                  key: const Key(
                                      "notification_page_doctorCallNo_input_field"),
                                  onChanged: (no) => contextE
                                      .read<EmergencyCubit>()
                                      .doctorCallNoChanged(no),
                                  // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                                  keyboardType: TextInputType.number,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('CANCEL'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('SAVE'),
                                  onPressed: () {
                                    contextE
                                        .read<EmergencyCubit>()
                                        .updateDoctorCallNo();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        UrlLauncher.launchUrl(
                            Uri.parse("tel://${stateE.retrievedDoctorNo}"));
                      }
                    },
                    label: "Call Doctor",
                    backgroundColor: mainColor,
                  ),
                  const SizedBox(height: 15.0),
                  CustomElevatedButton(
                    onPressed: () {
                      if (stateE.retrievedAmbulanceNo.isEmpty) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: CustomText(
                                text: "Ambulance Calling Number is not set!",
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              content: CustomText(
                                text:
                                    'You can enter the ambulance call number in "Settings" or here.',
                                fontSize: 16.0.sp,
                              ),
                              actions: <Widget>[
                                CustomTextFormField(
                                  hintText: "ambulanceCallNo".tr(),
                                  borderColor: mainColor,
                                  key: const Key(
                                      "notification_page_ambulanceCallNo_input_field"),
                                  onChanged: (no) => contextE
                                      .read<EmergencyCubit>()
                                      .ambulanceCallNoChanged(no),
                                  // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                                  keyboardType: TextInputType.number,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('CANCEL'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('SAVE'),
                                  onPressed: () {
                                    contextE
                                        .read<EmergencyCubit>()
                                        .updateAmbulanceCallNo();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        UrlLauncher.launchUrl(
                            Uri.parse("tel://${stateE.retrievedAmbulanceNo}"));
                      }
                    },
                    label: "Call Ambulance",
                    backgroundColor: mainColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
