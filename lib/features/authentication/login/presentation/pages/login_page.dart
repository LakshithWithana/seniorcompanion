import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newseniiorcompaniion/app/data/repository/auth_repository.dart';
import 'package:newseniiorcompaniion/core/service_locator/service_locator.dart';
import 'package:newseniiorcompaniion/features/authentication/login/presentation/pages/login_view.dart';

import '../../cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepository: locator<AuthRepository>(),
          ),
          lazy: false,
        ),
      ],
      child: const LoginView(),
    );
  }
}
