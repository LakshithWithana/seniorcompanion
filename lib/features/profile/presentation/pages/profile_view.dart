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
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FirstNameInputWidget(),
                    LastNameInputWidget(),
                    BirthdayInputWidget(),
                    AboutInputWidget(),
                    GenderSelecterWidget(),
                    SizedBox(height: 20.0),
                    PreferencesSelecterWidget(),
                    SizedBox(height: 40.0),
                    SaveButtonWidget(),
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
