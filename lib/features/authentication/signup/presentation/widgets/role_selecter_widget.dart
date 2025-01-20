import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/widgets/custom_text.dart';
import '../../cubit/signup_cubit.dart';

class RoleSelecterWidget extends StatefulWidget {
  const RoleSelecterWidget({super.key});

  @override
  State<RoleSelecterWidget> createState() => _RoleSelecterWidgetState();
}

class _RoleSelecterWidgetState extends State<RoleSelecterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.role != current.role,
      builder: (context, state) {
        return Column(
          key: const Key("signup_form_role_selecter"),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "whoAreYou".tr().toUpperCase(),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 50.0,
                maxWidth: 353.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        context.read<SignupCubit>().roleChanged("CG"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.role == "CG" ? mainBlue : white,
                      padding: const EdgeInsets.all(0),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: mainBlue, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width < 393
                          ? 160.0
                          : 170.0,
                      child: Center(
                        child: CustomText(
                          text: "caregiver".tr().toUpperCase(),
                          fontSize: 16.0,
                          color: state.role == "CG" ? white : mainBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<SignupCubit>().roleChanged("CR"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      backgroundColor: state.role == "CR" ? mainOrange : white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: mainOrange, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    child: SizedBox(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width < 393
                          ? 160.0
                          : 170.0,
                      child: Center(
                        child: CustomText(
                          textAlignment: TextAlign.left,
                          text: "careRecipient".tr().toUpperCase(),
                          fontSize: 16.0,
                          color: state.role == "CR" ? white : mainOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
