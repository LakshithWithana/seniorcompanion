import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';
import 'package:newseniiorcompaniion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class LastNameInputWidget extends StatelessWidget {
  LastNameInputWidget({super.key, required this.lastName});
  String lastName = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (contextP, stateP) {
        if (lastName != "") {
          contextP.read<ProfileCubit>().lastNameChanged(lastName);
        }
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return CustomTextFormField(
              roleType: state.user.role == "CR"
                  ? RoleType.careRecipient
                  : state.user.role == "CG"
                      ? RoleType.careGiver
                      : RoleType.general,
              hintText: "lastName".tr(),
              initialValue: lastName,
              borderColor: mainColor,
              key: const Key("profile_form_lastName_input_field"),
              onChanged: (lastName) =>
                  contextP.read<ProfileCubit>().lastNameChanged(lastName),
              keyboardType: TextInputType.name,
              errorText:
                  stateP.lastName.isNotValid && stateP.lastName.value != ""
                      ? "Please enter your Last Name"
                      : null,
            );
          },
        );
      },
    );
  }
}
