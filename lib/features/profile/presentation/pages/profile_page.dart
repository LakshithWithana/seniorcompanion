import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/features/profile/cubit/profile_cubit.dart';
import 'package:seniorcompanion/features/profile/data/repositories/profile_repository.dart';
import 'package:seniorcompanion/features/profile/presentation/pages/profile_view.dart';

import '../../../../core/service_locator/service_locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Page page() => const MaterialPage<void>(child: ProfilePage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(
            profileRepository: locator<ProfileRepository>(),
          ),
        ),
      ],
      child: const ProfileView(),
    );
  }
}
