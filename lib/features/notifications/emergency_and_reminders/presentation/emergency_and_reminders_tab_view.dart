import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_elevated_buttons.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_text.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/cubit/emergency_cubit.dart';

import '../../../../core/shared/widgets/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class EmergencyAndRemindersTabView extends StatefulWidget {
  const EmergencyAndRemindersTabView({super.key});

  @override
  State<EmergencyAndRemindersTabView> createState() =>
      _EmergencyAndRemindersTabViewState();
}

class _EmergencyAndRemindersTabViewState
    extends State<EmergencyAndRemindersTabView> {
  @override
  void initState() {
    super.initState();
    // Fetch data once when widget initializes
    final cubit = context.read<EmergencyCubit>();
    cubit.getAmbulanceCallNo();
    cubit.getDoctorCallNo();
    cubit.getEmergencyCallNo();
  }

  Future<void> _showNumberInputDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String hintText,
    required String inputFieldKey,
    required Function(String) onChanged,
    required VoidCallback onSave,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: title,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          content: CustomText(
            text: content,
            fontSize: 16.0,
          ),
          actions: <Widget>[
            CustomTextFormField(
              hintText: hintText.tr(),
              borderColor: mainColor,
              key: Key(inputFieldKey),
              onChanged: onChanged,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('SAVE'),
              onPressed: () {
                onSave();
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }

  Widget _buildEmergencyButton({
    required String label,
    required String retrievedNumber,
    required String dialogTitle,
    required String dialogContent,
    required String hintText,
    required String inputFieldKey,
    required Function(String) onNumberChanged,
    required VoidCallback onUpdateNumber,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: CustomElevatedButton(
        onPressed: () {
          if (retrievedNumber.isEmpty) {
            _showNumberInputDialog(
              context: context,
              title: dialogTitle,
              content: dialogContent,
              hintText: hintText,
              inputFieldKey: inputFieldKey,
              onChanged: onNumberChanged,
              onSave: onUpdateNumber,
            );
          } else {
            UrlLauncher.launchUrl(Uri.parse("tel://$retrievedNumber"));
          }
        },
        label: label,
        backgroundColor: mainColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmergencyCubit, EmergencyState>(
      listener: (context, state) {
        if (state.emergencyCallUpdated ||
            state.doctorCallUpdated ||
            state.ambulanceCallUpdated) {
          final message = state.emergencyCallUpdated
              ? 'Emergency Call Number Updated!'
              : state.doctorCallUpdated
                  ? 'Doctor Call Number Updated!'
                  : 'Ambulance Call Number Updated!';

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
        }
      },
      child: BlocBuilder<EmergencyCubit, EmergencyState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildEmergencyButton(
                    label: "Emergency Call",
                    retrievedNumber: state.retrievedEmergencyNo,
                    dialogTitle: "Emergency Calling Number is not set!",
                    dialogContent:
                        'You can enter the emergency call number in "Settings" or here.',
                    hintText: "emergencyCallNo",
                    inputFieldKey:
                        "notification_page_emergencyCallNo_input_field",
                    onNumberChanged: (no) => context
                        .read<EmergencyCubit>()
                        .emergencyCallNoChanged(no),
                    onUpdateNumber: () =>
                        context.read<EmergencyCubit>().updateEmergencyCallNo(),
                  ),
                  _buildEmergencyButton(
                    label: "Call Doctor",
                    retrievedNumber: state.retrievedDoctorNo,
                    dialogTitle: "Doctor's Calling Number is not set!",
                    dialogContent:
                        'You can enter the doctor\'s call number in "Settings" or here.',
                    hintText: "doctorCallNo",
                    inputFieldKey: "notification_page_doctorCallNo_input_field",
                    onNumberChanged: (no) =>
                        context.read<EmergencyCubit>().doctorCallNoChanged(no),
                    onUpdateNumber: () =>
                        context.read<EmergencyCubit>().updateDoctorCallNo(),
                  ),
                  _buildEmergencyButton(
                    label: "Call Ambulance",
                    retrievedNumber: state.retrievedAmbulanceNo,
                    dialogTitle: "Ambulance Calling Number is not set!",
                    dialogContent:
                        'You can enter the ambulance call number in "Settings" or here.',
                    hintText: "ambulanceCallNo",
                    inputFieldKey:
                        "notification_page_ambulanceCallNo_input_field",
                    onNumberChanged: (no) => context
                        .read<EmergencyCubit>()
                        .ambulanceCallNoChanged(no),
                    onUpdateNumber: () =>
                        context.read<EmergencyCubit>().updateAmbulanceCallNo(),
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
