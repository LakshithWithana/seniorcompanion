import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:seniorcompanion/app/data/data_provider/blocked_account/bloc_account_data_provider_impl.dart';
import 'package:seniorcompanion/app/data/data_provider/blocked_account/block_account_data_provider.dart';
import 'package:seniorcompanion/app/data/repository/blocked_account/blocked_account_repoository_impl.dart';
import 'package:seniorcompanion/app/data/repository/blocked_account/blocked_account_repository.dart';
import 'package:seniorcompanion/core/cache/cache.dart';
import 'package:seniorcompanion/core/loacation/data/data_provider/location_data_provider.dart';
import 'package:seniorcompanion/core/loacation/data/data_provider/location_data_provider_impl.dart';
import 'package:seniorcompanion/core/loacation/data/repository/location_repository.dart';
import 'package:seniorcompanion/core/loacation/data/repository/location_repository_impl.dart';
import 'package:seniorcompanion/features/chat/data/data_provider/chat_data_provider.dart';
import 'package:seniorcompanion/features/chat/data/data_provider/chat_data_provider_impl.dart';
import 'package:seniorcompanion/features/chat/data/repositories/chat_repository.dart';
import 'package:seniorcompanion/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/data/data_provider/emergency_data_provider.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/data/data_provider/emergency_data_provider_impl.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/data/repository/emergency_repository_impl.dart';
import 'package:seniorcompanion/features/notifications/emergency_and_reminders/data/repository/emergency_repositoy.dart';
import 'package:seniorcompanion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:seniorcompanion/features/profile/data/data_provider/profile_data_provider_impl.dart';
import 'package:seniorcompanion/features/profile/data/repositories/profile_repository.dart';
import 'package:seniorcompanion/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:seniorcompanion/features/search/data/data_provider/search_data_provider.dart';
import 'package:seniorcompanion/features/search/data/data_provider/search_data_provider_impl.dart';
import 'package:seniorcompanion/features/search/data/repository/search_repository.dart';
import 'package:seniorcompanion/features/search/data/repository/search_repository_impl.dart';
import 'package:seniorcompanion/features/settings/data/data_providers/settings_data_provider.dart';
import 'package:seniorcompanion/features/settings/data/data_providers/settings_data_provider_impl.dart';
import 'package:seniorcompanion/features/settings/data/repositories/settings_repository.dart';
import 'package:seniorcompanion/features/settings/data/repositories/settings_repository_impl.dart';

import '../../app/data/data_provider/auth_data_provider.dart';
import '../../app/data/data_provider/auth_data_provider_impl.dart';
import '../../app/data/data_provider/custom_claims/custom_claims_data_provider.dart';
import '../../app/data/data_provider/custom_claims/custom_claims_data_provider_impl.dart';
import '../../app/data/repository/auth_repository.dart';
import '../../app/data/repository/auth_repository_impl.dart';
import '../../app/data/repository/custom_claims/custom_claims_repository.dart';
import '../../app/data/repository/custom_claims/custom_claims_repository_impl.dart';
import '../user_details/data/data_provider/user_details_data_provider.dart';
import '../user_details/data/data_provider/user_details_data_provider_impl.dart';
import '../user_details/data/repository/user_details_repository.dart';
import '../user_details/data/repository/user_details_repository_impl.dart';

final locator = GetIt.instance;

void setupLocator() {
  //! Firebase Auth
  registerLazySingleton<FirebaseAuth>(FirebaseAuth.instance);

  //! Firebase Firestore
  registerLazySingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // FirebaseFirestore.instance.clearPersistence();

  //! Cache Client
  registerLazySingleton(CacheClient());

  //! Custom claims
  registerLazySingleton<CustomClaimsDataProvider>(CustomClaimsDataProviderImpl(
      cacheClient: locator(),
      firebaseFirestore: locator(),
      firebaseAuth: locator()));

  registerLazySingleton<CustomClaimsRepository>(CustomClaimsRepositoryImpl(
    customClaimsDataProvider: locator(),
  ));

  //! Auth
  registerLazySingleton<AuthDataProvider>(AuthDataProviderImpl(
    customClaimsRepository: locator(),
    firebaseAuth: locator(),
    cache:
        locator(), //TODO if this cache client is not working find a alternative like hive
    firebaseFirestore: locator(),
  ));
  registerLazySingleton<AuthRepository>(
      AuthRepositoryImpl(authDataProvider: locator()));
  //!

  //! User details
  registerLazySingleton<UserDetailsDataProvider>(UserDetailsDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
  ));

  registerLazySingleton<UserDetailsRepository>(UserDetailsRepositoryImpl(
    userDetailsDataProvider: locator(),
  ));
  //!

  //! blocked user status
  registerLazySingleton<BlockAccountDataProvider>(BlockAccountDataProviderImpl(
      firebaseAuth: locator(), firebaseFirestore: locator()));

  registerLazySingleton<BlockedAccountRepository>(
      BlockedAccountRepositoryImpl(locator()));
  //!

  //! Profile data
  registerLazySingleton<ProfileDataProvider>(ProfileDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
    customClaimsRepository: locator(),
  ));

  registerLazySingleton<ProfileRepository>(ProfileRepositoryImpl(
    profileDataProvider: locator(),
  ));
  //!

  //! Location data
  registerLazySingleton<LocationDataProvider>(LocationDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
  ));

  registerLazySingleton<LocationRepository>(LocationRepositoryImpl(
    locationDataProvider: locator(),
  ));
  //!

  //! Search data
  registerLazySingleton<SearchDataProvider>(SearchDataProviderImpl(
    firebaseFirestore: locator(),
    firebaseAuth: locator(),
  ));

  registerLazySingleton<SearchRepository>(
      SearchRepositoryImpl(searchDataProvider: locator()));
  //!

  //! chat data
  registerLazySingleton<ChatDataProvider>(ChatDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
  ));

  registerLazySingleton<ChatRepository>(
      ChatRepositoryImpl(chatDataProvider: locator()));
  //!

  //! emergency
  registerLazySingleton<EmergencyDataProvider>(EmergencyDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
  ));

  registerLazySingleton<EmergencyRepository>(
      EmergencyRepositoryImpl(emergencyDataProvider: locator()));
  //!

  //! settings
  registerLazySingleton<SettingsDataProvider>(SettingsDataProviderImpl(
    firebaseAuth: locator(),
    firebaseFirestore: locator(),
  ));

  registerLazySingleton<SettingsRepository>(
      SettingsRepositoryImpl(settingsDataProvider: locator()));
  //!
}

void registerLazySingleton<T extends Object>(T object) {
  return locator.registerLazySingleton<T>(() => object);
}
