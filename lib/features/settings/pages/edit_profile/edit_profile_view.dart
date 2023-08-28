import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/about_input_widget.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/birthday_input_widget.dart';

import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/first_name_input_widget.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/gender_selection_widget.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/last_name_input_widget.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/widgets/update_button_widget.dart';

import '../../../../core/shared/widgets/custom_text.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.userDetails});
  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "editProfile".tr().toUpperCase(),
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              FirstNameInputWidget(firstName: userDetails.firstName),
              LastNameInputWidget(lastName: userDetails.lastName),
              GenderSelecterWidget(gender: userDetails.gender),
              const SizedBox(height: 20.0),
              BirthdayInputWidget(birthday: userDetails.birthday),
              AboutInputWidget(about: userDetails.about),
              const UpdateButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
