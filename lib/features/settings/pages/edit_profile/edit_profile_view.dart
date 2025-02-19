import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/about_input_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/birthday_input_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/email_read_only_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/first_name_input_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/gender_selection_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/last_name_input_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/profile_picture_widget.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/widgets/update_button_widget.dart';

import '../../../../core/shared/widgets/custom_text.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.userDetails});
  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        shadowColor: Theme.of(context).shadowColor,
        centerTitle: false,
        title: CustomText(
          text: "editProfile".tr().toUpperCase(),
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ProfilePictureWidget(
                profilePicUrl: userDetails.profilePicURL,
              ),
              FirstNameInputWidget(
                firstName: userDetails.firstName,
                lastName: userDetails.lastName,
                about: userDetails.about,
              ),
              LastNameInputWidget(
                lastName: userDetails.lastName,
                firstName: userDetails.firstName,
                about: userDetails.about,
              ),
              EmailReadOnlyWidget(email: userDetails.email),
              GenderSelecterWidget(gender: userDetails.gender),
              const SizedBox(height: 25),
              BirthdayInputWidget(birthday: userDetails.birthday),
              AboutInputWidget(
                about: userDetails.about,
                firstName: userDetails.firstName,
                lastName: userDetails.lastName,
              ),
              const UpdateButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
