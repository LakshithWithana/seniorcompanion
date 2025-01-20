import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/cubit/blocked_status_cubit.dart';
import 'package:newseniiorcompaniion/core/service_locator/service_locator.dart';
import 'package:newseniiorcompaniion/features/user_home/presentation/pages/user_home_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key, required this.role});
  final String role;

  static Page page({required String role}) =>
      MaterialPage<void>(child: UserHomePage(role: role));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlockedStatusCubit(blockedAccountRepository: locator()),
      child: UserHomeView(role: role),
    );
  }
}
