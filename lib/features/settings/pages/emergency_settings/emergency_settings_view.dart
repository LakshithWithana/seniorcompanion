import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../notifications/emergency_and_reminders/cubit/emergency_cubit.dart';

class EmergencySettingsView extends StatefulWidget {
  const EmergencySettingsView({
    Key? key,
    this.emergencyPhoneNumber,
    this.doctorPhoneNumber,
    this.ambulancePhoneNumber,
  }) : super(key: key);
  final String? emergencyPhoneNumber;
  final String? doctorPhoneNumber;
  final String? ambulancePhoneNumber;

  @override
  State<EmergencySettingsView> createState() => _EmergencySettingsViewState();
}

class _EmergencySettingsViewState extends State<EmergencySettingsView> {
  String? emergencyPhoneNumber = "";
  String? doctorPhoneNumber = "";
  String? ambulancePhoneNumber = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      emergencyPhoneNumber = widget.emergencyPhoneNumber;
      doctorPhoneNumber = widget.doctorPhoneNumber;
      ambulancePhoneNumber = widget.ambulancePhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "emergencySettings".tr().toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
            builder: (contextU, stateU) {
              return Column(
                children: [
                  Divider(),
                  CustomText(
                    text:
                        'You can enter or change your "Emergency Call" number here.',
                    fontSize: 16.0.sp,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextFormField(
                    initialValue: emergencyPhoneNumber,
                    hintText: "emergencyCallNo".tr(),
                    borderColor: mainColor,
                    key: const Key(
                        "emergencySettings_page_emergencyCallNo_input_field"),
                    onChanged: (no) => contextU
                        .read<EmergencyCubit>()
                        .emergencyCallNoChanged(no),
                    // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                    keyboardType: TextInputType.number,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: CustomText(
                        text: 'save'.tr().toUpperCase(),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      onPressed: () {
                        contextU.read<EmergencyCubit>().updateEmergencyCallNo();
                      },
                    ),
                  ),
                  Divider(),
                  //------------------------------------------------------------
                  CustomText(
                    text:
                        'You can enter or change your "Doctor\'s Phone" number here.',
                    fontSize: 16.0.sp,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextFormField(
                    initialValue: doctorPhoneNumber,
                    hintText: "doctorCallNo".tr(),
                    borderColor: mainColor,
                    key: const Key(
                        "emergencySettings_page_doctorPhoneNo_input_field"),
                    onChanged: (no) =>
                        contextU.read<EmergencyCubit>().doctorCallNoChanged(no),
                    // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                    keyboardType: TextInputType.number,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: CustomText(
                        text: 'save'.tr().toUpperCase(),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      onPressed: () {
                        contextU.read<EmergencyCubit>().updateDoctorCallNo();
                      },
                    ),
                  ),
                  Divider(),
                  //------------------------------------------------------------
                  CustomText(
                    text:
                        'You can enter or change your "Ambulance Call" number here.',
                    fontSize: 16.0.sp,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextFormField(
                    initialValue: ambulancePhoneNumber,
                    hintText: "ambulanceCallNo".tr(),
                    borderColor: mainColor,
                    key: const Key(
                        "emergencySettings_page_ambulancePhoneNo_input_field"),
                    onChanged: (no) => contextU
                        .read<EmergencyCubit>()
                        .ambulanceCallNoChanged(no),
                    // contextP.read<ProfileCubit>().firstNameChanged(firstName),
                    keyboardType: TextInputType.number,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: CustomText(
                        text: 'save'.tr().toUpperCase(),
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      onPressed: () {
                        contextU.read<EmergencyCubit>().updateAmbulanceCallNo();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
