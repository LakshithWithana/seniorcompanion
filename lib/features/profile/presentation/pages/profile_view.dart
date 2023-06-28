import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/about_input_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/birthday_input_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/first_name_input_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/gender_selection_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/last_name_input_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/preferences_selecter_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/profile_picture_widget.dart';
import 'package:seniorcompanion/features/profile/presentation/widgets/save_button_widget.dart';

import '../../../../core/shared/widgets/custom_text.dart';
import '../../cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    Text(state.errorMessage ?? "User Details Updation Failed"),
              ),
            );
        }
        // if (state.profilePicUrl != "") {
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(
        //       const SnackBar(
        //         content: Text("Profile picture uploaded successfully"),
        //       ),
        //     );
        // }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: CustomText(
            text: "profile".tr().toUpperCase(),
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfilePictureWidget(),
                    const SizedBox(height: 20.0),
                    const FirstNameInputWidget(),
                    const LastNameInputWidget(),
                    const BirthdayInputWidget(),
                    const AboutInputWidget(),
                    const GenderSelecterWidget(),
                    const SizedBox(height: 20.0),
                    const PreferencesSelecterWidget(),
                    const SizedBox(height: 40.0),
                    const SaveButtonWidget(),
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
