import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/app/bloc/app_bloc_observer.dart';
import 'package:seniorcompanion/app/routes/routes.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/user_details/cubit/cubit/user_details_cubit.dart';
import 'package:seniorcompanion/core/user_details/data/repository/user_details_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flow_builder/flow_builder.dart';

import 'app/data/repository/auth_repository.dart';
import 'app/data/repository/custom_claims/custom_claims_repository.dart';
import 'core/service_locator/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  final AuthRepository authRepository = locator<AuthRepository>();
  await authRepository.scUser.first;
  final CustomClaimsRepository customClaimsRepository =
      locator<CustomClaimsRepository>();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/translations',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        child: MyApp(
            authRepository: authRepository,
            customClaimsRepository: customClaimsRepository)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthRepository authRepository,
    required CustomClaimsRepository customClaimsRepository,
  })  : _authRepository = authRepository,
        _customClaimsRepository = customClaimsRepository;

  final AuthRepository _authRepository;
  final CustomClaimsRepository _customClaimsRepository;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return App(
            authRepository: _authRepository,
            customClaimsRepository: _customClaimsRepository);
      },
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
    required CustomClaimsRepository customClaimsRepository,
  })  : _authRepository = authRepository,
        _customClaimsRepository = customClaimsRepository;

  final AuthRepository _authRepository;
  final CustomClaimsRepository _customClaimsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _authRepository,
        ),
        RepositoryProvider(
          create: (context) => _customClaimsRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(
                authRepository: _authRepository,
                customClaimsRepository: _customClaimsRepository),
          ),
          BlocProvider(
            create: (context) => UserDetailsCubit(
              userDetailsRepository: locator<UserDetailsRepository>(),
              authRepository: _authRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Companion',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
