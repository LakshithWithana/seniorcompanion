import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/form_models/general_field.dart';

abstract class SettingsDataProvider {
  Future<Unit> updateSearchPreferences({required List<String> preferencesList});

  Future<Unit> updateUserProfileData(
      {required GeneralField firstName,
      required GeneralField lastName,
      required GeneralField about});

  Future<Unit> uploadProfileImage({required File file});
}
