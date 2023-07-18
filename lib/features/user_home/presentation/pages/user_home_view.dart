import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/routes/bloc/main_page_routes_bloc.dart';
import 'package:seniorcompanion/core/constants/colors.dart';

import '../../../../app/routes/bottom_nav_items/bottom_nav_items.dart';
import '../../../../core/shared/widgets/custom_text.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageRoutesBloc, MainPageRoutesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            shadowColor: Theme.of(context).shadowColor,
            centerTitle: false,
            title: CustomText(
              text:
                  bottomNavItems.elementAt(state.tabIndex).label!.toUpperCase(),
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
              elevation: 2.0,
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey,
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
      },
    );
  }
}
