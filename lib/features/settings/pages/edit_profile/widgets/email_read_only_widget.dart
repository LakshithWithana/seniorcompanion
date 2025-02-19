import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/bloc/app_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class EmailReadOnlyWidget extends StatelessWidget {
  const EmailReadOnlyWidget({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return CustomTextFormField(
          roleType: state.user.role == "CR"
              ? RoleType.careRecipient
              : state.user.role == "CG"
                  ? RoleType.careGiver
                  : RoleType.general,
          enabled: false,
          hintText: "email".tr(),
          initialValue: email,
          borderColor: mainColor,
          readOnly: true,
        );
      },
    );
  }
}
