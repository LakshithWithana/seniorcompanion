import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:seniorcompanion/core/cache/cache.dart';

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
}

void registerLazySingleton<T extends Object>(T object) {
  return locator.registerLazySingleton<T>(() => object);
}
