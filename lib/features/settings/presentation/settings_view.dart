import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/core/shared/widgets/custom_text.dart';
import 'package:newseniiorcompaniion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:newseniiorcompaniion/features/settings/cubit/settings_cubit.dart';
import 'package:newseniiorcompaniion/features/settings/pages/edit_profile/edit_profile_page.dart';
import 'package:newseniiorcompaniion/features/settings/pages/emergency_settings/emergency_settings_page.dart';
import 'package:newseniiorcompaniion/features/settings/pages/search_settings/search_settings_page.dart';
import '../../../core/shared/pages/webview_page.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  Widget _buildSettingsTile({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
    Color? textColor,
    Widget? leadingWidget,
  }) {
    return Column(
      children: [
        const Divider(height: 1),
        ListTile(
          onTap: onTap,
          title: CustomText(
            text: title.tr().toUpperCase(),
            fontSize: 18.0,
            color: textColor,
          ),
          leading: leadingWidget ??
              Image.asset(
                iconPath,
                scale: 25,
              ),
        ),
      ],
    );
  }

  Future<void> _showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String cancelText,
    required String confirmText,
    required VoidCallback onConfirm,
    Color? titleColor,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: white,
        title: CustomText(
          text: title,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: titleColor,
        ),
        content: CustomText(
          text: content,
          fontSize: 16.0,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              confirmText,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(cancelText),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsCubit, UserDetailsState>(
      listener: (_, __) {},
      builder: (context, userState) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildSettingsTile(
                    title: "searchSettings",
                    iconPath: "assets/images/icons/Icons_search copy.png",
                    onTap: () {
                      userState.whenOrNull(
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
                  ),
                  _buildSettingsTile(
                    title: "editProfile",
                    iconPath: "assets/images/icons/Icons_edit profile copy.png",
                    onTap: () {
                      userState.whenOrNull(
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
                  ),
                  _buildSettingsTile(
                    title: "emergencySettings",
                    iconPath:
                        "assets/images/icons/Icons_Emergency settings copy.png",
                    onTap: () {
                      userState.whenOrNull(
                        loaded: (userDetails) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EmergencySettingsPage(
                                emergencyPhoneNumber:
                                    userDetails.emergencyNumber,
                                doctorPhoneNumber: userDetails.doctorNumber,
                                ambulancePhoneNumber:
                                    userDetails.ambulanceNumber,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  _buildSettingsTile(
                    title: "inviteFriends",
                    iconPath: "assets/images/icons/Icons_add friends copy.png",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    title: "termsAndConditions",
                    iconPath:
                        "assets/images/icons/Icons_terms and condition copy.png",
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const WebViewPage(
                            title: "Terms & Conditions",
                            url:
                                "https://www.seniiorcompaniion.com/terms-conditions/"),
                      ),
                    ),
                  ),
                  _buildSettingsTile(
                    title: "helpAndFaq",
                    iconPath:
                        "assets/images/icons/Icons_help and facs copy.png",
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const WebViewPage(
                            title: "FAQ",
                            url: "https://www.seniiorcompaniion.com/home/faq/"),
                      ),
                    ),
                  ),
                  _buildSettingsTile(
                    title: "aboutUs",
                    iconPath: "assets/images/icons/Icons_about us copy.png",
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const WebViewPage(
                            title: "About Us",
                            url: "https://www.seniiorcompaniion.com/"),
                      ),
                    ),
                  ),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, _) => _buildSettingsTile(
                      title: "logOut",
                      iconPath: "",
                      textColor: Colors.red,
                      leadingWidget: const Icon(
                        Icons.logout,
                        size: 35,
                        color: Colors.red,
                      ),
                      onTap: () => _showConfirmationDialog(
                        context: context,
                        title: "Logout",
                        content:
                            'You are going to logout. Do you wish to continue?',
                        cancelText: 'Cancel',
                        confirmText: 'Logout',
                        onConfirm: () => context.read<SettingsCubit>().logOut(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {
                  if (state.deleteErrorMessage.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.deleteErrorMessage)),
                    );
                  }
                },
                builder: (context, _) => _buildSettingsTile(
                  title: "deleteAccount",
                  iconPath: "",
                  textColor: Colors.red,
                  leadingWidget: const Icon(
                    Icons.person_remove,
                    size: 35,
                    color: Colors.red,
                  ),
                  onTap: () => _showConfirmationDialog(
                    context: context,
                    title: "Account Deletion!",
                    titleColor: Colors.red,
                    content:
                        'This will permently delete the account. Do you wish to continue?',
                    cancelText: 'NO',
                    confirmText: 'DELETE',
                    onConfirm: () =>
                        context.read<SettingsCubit>().deleteAccount(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
