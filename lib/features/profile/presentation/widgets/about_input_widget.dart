import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';

class AboutInputWidget extends StatelessWidget {
  const AboutInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.about != current.about,
      builder: (context, state) {
        return CustomTextFormField(
          hintText: "about".tr(),
          borderColor: mainColor,
          key: const Key("profile_form_about_input_field"),
          onChanged: (about) =>
              context.read<ProfileCubit>().aboutChanged(about),
          keyboardType: TextInputType.text,
          errorText: state.about.isNotValid && state.about.value != ""
              ? "Please type a sentence described yourself"
              : null,
        );
      },
    );
  }
}
