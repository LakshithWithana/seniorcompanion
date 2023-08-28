import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/shared/widgets/custom_text.dart';
import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:seniorcompanion/features/settings/pages/edit_profile/edit_profile_page.dart';
import 'package:seniorcompanion/features/settings/pages/emergency_settings/emergency_settings_page.dart';
import 'package:seniorcompanion/features/settings/pages/search_settings/search_settings_page.dart';

import '../../../app/data/repository/auth_repository.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/shared/pages/webview_page.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepository authRepository = locator<AuthRepository>();
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (contextU, stateU) {
        stateU.whenOrNull(
          loaded: (userDetails) {},
        );
        return SingleChildScrollView(
          child: Column(
            children: [
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  stateU.whenOrNull(
                    loaded: (userDetails) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchSettingsPage(
                              preferences: userDetails.preferences),
                        ),
                      );
                    },
                  );
                },
                title: CustomText(
                  text: "searchSettings".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.manage_search,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  stateU.whenOrNull(
                    loaded: (userDetails) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditProfilePage(userDetails: userDetails),
                        ),
                      );
                    },
                  );
                },
                title: CustomText(
                  text: "editProfile".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.co_present_rounded,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  stateU.whenOrNull(
                    loaded: (userDetails) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmergencySettingsPage(
                            emergencyPhoneNumber: userDetails.emergencyNumber,
                            doctorPhoneNumber: userDetails.doctorNumber,
                            ambulancePhoneNumber: userDetails.ambulanceNumber,
                          ),
                        ),
                      );
                    },
                  );
                },
                title: CustomText(
                  text: "emergencySettings".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.emergency,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {},
                title: CustomText(
                  text: "inviteFriends".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.group_add,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WebViewPage(
                          title: "Terms & Conditions",
                          url:
                              "http://www.seniiorcompaniion.com/terms-conditions/")));
                },
                title: CustomText(
                  text: "termsAndConditions".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.fact_check,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WebViewPage(
                          title: "Privacy Policy",
                          url: "http://www.seniiorcompaniion.com/home/faq/")));
                },
                title: CustomText(
                  text: "helpAndFaq".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.help,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WebViewPage(
                          title: "Privacy Policy",
                          url: "http://www.seniiorcompaniion.com/")));
                },
                title: CustomText(
                  text: "aboutUs".tr(),
                  fontSize: 20.0.sp,
                ),
                leading: const Icon(
                  Icons.info_rounded,
                  color: mainColor,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                onTap: () {
                  authRepository.signOutUser();
                },
                title: CustomText(
                  text: "logOut".tr(),
                  fontSize: 20.0.sp,
                  color: Colors.red,
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
