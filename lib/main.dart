import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seniorcompanion/app/bloc/app_bloc.dart';
import 'package:seniorcompanion/app/bloc/app_bloc_observer.dart';
import 'package:seniorcompanion/app/routes/bloc/main_page_routes_bloc.dart';
import 'package:seniorcompanion/app/routes/routes.dart';
import 'package:seniorcompanion/core/constants/colors.dart';
import 'package:seniorcompanion/core/loacation/bloc/location_bloc.dart';
import 'package:seniorcompanion/core/loacation/data/repository/location_repository.dart';
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
  final LocationRepository locationRepository = locator<LocationRepository>();
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
          customClaimsRepository: customClaimsRepository,
          locationRepository: locationRepository,
        )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required AuthRepository authRepository,
    required CustomClaimsRepository customClaimsRepository,
    required LocationRepository locationRepository,
  })  : _authRepository = authRepository,
        _customClaimsRepository = customClaimsRepository,
        _locationRepository = locationRepository;

  final AuthRepository _authRepository;
  final CustomClaimsRepository _customClaimsRepository;
  final LocationRepository _locationRepository;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return App(
          authRepository: _authRepository,
          customClaimsRepository: _customClaimsRepository,
          locationRepository: _locationRepository,
        );
      },
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
    required CustomClaimsRepository customClaimsRepository,
    required LocationRepository locationRepository,
  })  : _authRepository = authRepository,
        _customClaimsRepository = customClaimsRepository,
        _locationRepository = locationRepository;

  final AuthRepository _authRepository;
  final CustomClaimsRepository _customClaimsRepository;
  final LocationRepository _locationRepository;

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
        RepositoryProvider(
          create: (context) => _locationRepository,
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
          BlocProvider(
            create: (context) =>
                LocationBloc(locationRepository: locator<LocationRepository>()),
          ),
          // BlocProvider<MainPageRoutesBloc>.value(value: material),
          BlocProvider(
            create: (context) => MainPageRoutesBloc(),
          )
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
      // AnimatedSplashScreen(
      //   duration: 3000,
      //   splash: Image.asset("assets/images/logo.png"),
      //   splashTransition: SplashTransition.fadeTransition,
      //   pageTransitionType: PageTransitionType.fade,
      //   backgroundColor: mainColor,
      //   nextScreen: FlowBuilder<AppStatus>(
      //     state: context.select((AppBloc bloc) => bloc.state.status),
      //     onGeneratePages: onGenerateAppViewPages,
      //   ),
      // ),
    );
  }
}
