import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/form_models/general_field.dart';

abstract class SettingsRepository {
  Future<Either<String, Unit>> updateSearchPreferences(
      {required List<String> preferencesList});

  Future<Either<String, Unit>> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField about,
    required String firstNameLastValue,
    required String lastNameLastValue,
    required String aboutLastValue,
  });

  Future<Either<String, Unit>> uploadProfileImage({
    required File file,
  });

  Future<Either<String, Unit>> deleteAccount();
}
