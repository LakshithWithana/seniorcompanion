import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class FirstNameInputWidget extends StatelessWidget {
  FirstNameInputWidget({super.key, required this.firstName});
  String? firstName = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (contextP, stateP) {
        if (firstName != "") {
          contextP.read<ProfileCubit>().firstNameChanged(firstName!);
        }
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              initialValue: firstName,
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "firstName".tr(),
              borderColor: mainBlue,
              key: const Key("profile_form_firstName_input_field"),
              onChanged: (firstName) =>
                  contextP.read<ProfileCubit>().firstNameChanged(firstName),
              keyboardType: TextInputType.name,
              errorText:
                  stateP.firstName.isNotValid && stateP.firstName.value != ""
                      ? "Please enter your First Name"
                      : null,
            );
          },
        );
      },
    );
  }
}
