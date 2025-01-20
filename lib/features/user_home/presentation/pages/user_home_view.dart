import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newseniiorcompaniion/app/cubit/blocked_status_cubit.dart';
import 'package:newseniiorcompaniion/app/routes/bloc/main_page_routes_bloc.dart';
import 'package:newseniiorcompaniion/core/constants/colors.dart';
import 'package:newseniiorcompaniion/features/block_screen/presentation/block_screen_page.dart';

// import '../../../../app/routes/bottom_nav_items/bottom_nav_items.dart';
import '../../../../core/shared/widgets/custom_text.dart';
import '../../../chat/presentation/chat_page.dart';
import '../../../notifications/presentation/pages/notification_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../settings/presentation/settings_page.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key, required this.role});
  final String role;

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  bool splashed = true;
  bool splashVisible = true;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        splashed = false;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        splashVisible = false;
      });
    });
    BlocProvider.of<BlockedStatusCubit>(context).getBlockedAccountStatus();
    return Stack(
      children: [
        BlocBuilder<MainPageRoutesBloc, MainPageRoutesState>(
          builder: (context, state) {
            List<BottomNavigationBarItem> bottomNavItems =
                <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: state.tabIndex == 0
                    ? Image.asset(
                        "assets/images/icons/Icons_search copy.png",
                        scale: 25,
                      )
                    : Image.asset(
                        "assets/images/icons/Icons_search.png",
                        scale: 25,
                      ),
                label: 'search'.tr(),
              ),
              BottomNavigationBarItem(
                icon: state.tabIndex == 1
                    ? Image.asset(
                        "assets/images/icons/Icons_chat copy.png",
                        scale: 25,
                      )
                    : Image.asset(
                        "assets/images/icons/Icons_chat.png",
                        scale: 25,
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
                        "assets/images/icons/Icons_notification copy.png",
                        scale: 25,
                      )
                    : Image.asset(
                        "assets/images/icons/Icons_notification.png",
                        scale: 25,
                      ),
                label: 'notifications'.tr(),
              ),
              BottomNavigationBarItem(
                icon: state.tabIndex == 3
                    ? Image.asset(
                        "assets/images/icons/Icons_profile copy.png",
                        scale: 25,
                      )
                    : Image.asset(
                        "assets/images/icons/Icons_profile.png",
                        scale: 25,
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
                if (stateB.userDetails.tmpBlock ||
                    stateB.userDetails.pmtBlock) {
                  return BlockScreenPage(
                    tmpBlocked: stateB.userDetails.tmpBlock,
                    pmtBlocked: stateB.userDetails.pmtBlock,
                  );
                } else {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      shadowColor: Theme.of(context).shadowColor,
                      centerTitle: false,
                      title: CustomText(
                        text: bottomNavItems
                            .elementAt(state.tabIndex)
                            .label!
                            .toUpperCase(),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            "assets/images/logo_clr.png",
                            scale: 8,
                          ),
                        ),
                      ],
                      // state.tabIndex == 0
                      //     ? [
                      //         IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(
                      //             Icons.settings,
                      //             color: role == "CG" ? mainBlue : mainOrange,
                      //           ),
                      //         ),
                      //       ]
                      //     : null,
                    ),

                    body: bottomNavScreen.elementAt(state.tabIndex),
                    bottomNavigationBar: Container(
                      decoration: const BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey,
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
                        backgroundColor: Color(0xFFFFFFFF),
                        selectedItemColor: mainColor,
                        unselectedItemColor: Colors.grey.shade500,
                        selectedLabelStyle: const TextStyle(color: mainColor),
                        unselectedLabelStyle:
                            const TextStyle(color: Colors.white),

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
        ),
        splashVisible
            ? AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: splashed ? 1 : 0,
                child: Container(
                  color: mainColor,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.0.w),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
