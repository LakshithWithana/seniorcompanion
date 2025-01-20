import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/cubit/blocked_status_cubit.dart';
import 'package:seniorcompanion/app/routes/bloc/main_page_routes_bloc.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/features/block_screen/presentation/block_screen_page.dart';

// import '../../../../app/routes/bottom_nav_items/bottom_nav_items.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../../chat/presentation/chat_page.dart';
import '../../../notifications/presentation/pages/notification_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../settings/presentation/settings_page.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlockedStatusCubit>(context).getBlockedAccountStatus();
    return BlocBuilder<MainPageRoutesBloc, MainPageRoutesState>(
      builder: (context, state) {
        List<BottomNavigationBarItem> bottomNavItems =
            <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: state.tabIndex == 0
                ? Image.asset(
                    "assets/images/icons/search_ac.png",
                    scale: 1.5,
                  )
                : Image.asset(
                    "assets/images/icons/search_inac.png",
                    scale: 1.5,
                  ),
            label: 'search'.tr(),
          ),
          BottomNavigationBarItem(
            icon: state.tabIndex == 1
                ? Image.asset(
                    "assets/images/icons/chat_ac.png",
                    scale: 1.5,
                  )
                : Image.asset(
                    "assets/images/icons/chat_inac.png",
                    scale: 1.5,
                  ),
            label: 'chat'.tr(),
          ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.favorite_outline),
          //   label: 'wellbeing'.tr(),
          // ),
          BottomNavigationBarItem(
            icon: state.tabIndex == 2
                ? Image.asset(
                    "assets/images/icons/notifications_ac.png",
                    scale: 1.5,
                  )
                : Image.asset(
                    "assets/images/icons/notifications_inac.png",
                    scale: 1.5,
                  ),
            label: 'notifications'.tr(),
          ),
          BottomNavigationBarItem(
            icon: state.tabIndex == 3
                ? Image.asset(
                    "assets/images/icons/profile_ac.png",
                    scale: 1.5,
                  )
                : Image.asset(
                    "assets/images/icons/profile_inac.png",
                    scale: 1.5,
                  ),
            label: 'settings'.tr(),
          ),
        ];

        List<Widget> bottomNavScreen = <Widget>[
          const SearchPage(),
          const ChatPage(),
          const NotificationPage(),
          const SettingsPage(),
        ];
        return BlocBuilder<BlockedStatusCubit, BlockedStatusState>(
          builder: (contextB, stateB) {
            if (stateB.userDetails.tmpBlock || stateB.userDetails.pmtBlock) {
              return BlockScreenPage(
                tmpBlocked: stateB.userDetails.tmpBlock,
                pmtBlocked: stateB.userDetails.pmtBlock,
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  // backgroundColor: Colors.white,
                  shadowColor: Theme.of(context).shadowColor,
                  centerTitle: false,
                  title: CustomText(
                    text: bottomNavItems
                        .elementAt(state.tabIndex)
                        .label!
                        .toUpperCase(),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  actions: state.tabIndex == 0
                      ? [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              color: role == "CG" ? mainBlue : mainOrange,
                            ),
                          ),
                        ]
                      : null,
                ),

                body: bottomNavScreen.elementAt(state.tabIndex),
                bottomNavigationBar: Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    elevation: 2.0,
                    items: bottomNavItems,
                    currentIndex: state.tabIndex,
                    backgroundColor: const Color(0xFFC2FFF9),
                    selectedItemColor: mainColor,
                    unselectedItemColor: Colors.grey.shade500,
                    selectedLabelStyle: const TextStyle(color: mainColor),
                    unselectedLabelStyle: const TextStyle(color: Colors.white),

                    // selectedItemColor: Theme.of(context).colorScheme.primary,
                    // unselectedItemColor: Colors.grey,
                    onTap: (index) {
                      BlocProvider.of<MainPageRoutesBloc>(context)
                          .add(TabChange(tabIndex: index));
                    },
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     authRepository.signOutUser();
                //   },
                //   child: const Text("Logout"),
                // ),
              );
            }
          },
        );
      },
    );
  }
}
