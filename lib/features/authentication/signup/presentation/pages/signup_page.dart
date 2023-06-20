import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';
import 'package:seniorcompanion/core/service_locator/service_locator.dart';
import 'package:seniorcompanion/features/authentication/signup/cubit/signup_cubit.dart';
import 'package:seniorcompanion/features/authentication/signup/presentation/pages/signup_view.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static Page page() => const MaterialPage<void>(child: SignupPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(
            authRepository: locator<AuthRepository>(),
          ),
        ),
      ],
      child: const SignupView(),
    );
  }
}
