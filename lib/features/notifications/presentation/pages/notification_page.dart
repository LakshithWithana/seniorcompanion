import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/data/repository/auth_repository.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/user_details/cubit/cubit/user_details_cubit.dart';
import '../../../../core/user_details/data/repository/user_details_repository.dart';
import 'notification_view.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static Page page() => const MaterialPage<void>(child: NotificationPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDetailsCubit(
              userDetailsRepository: locator<UserDetailsRepository>(),
              authRepository: locator<AuthRepository>()),
        ),
      ],
      child: const NotificationView(),
    );
  }
}
