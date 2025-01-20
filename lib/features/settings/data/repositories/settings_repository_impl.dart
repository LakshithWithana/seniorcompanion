import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/features/settings/data/data_providers/settings_data_provider.dart';
import 'package:newseniiorcompaniion/features/settings/data/failures/profile_deletion_failure.dart';
import 'package:newseniiorcompaniion/features/settings/data/failures/settings_update_failure.dart';
import 'package:newseniiorcompaniion/features/settings/data/repositories/settings_repository.dart';

import '../../../../core/form_models/general_field.dart';
import '../../../profile/data/failures/profile_data_update_failure.dart';
import '../../../profile/data/failures/profile_picture_upload_failure.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsDataProvider _settingsDataProvider;

  SettingsRepositoryImpl({required SettingsDataProvider settingsDataProvider})
      : _settingsDataProvider = settingsDataProvider;

  @override
  Future<Either<String, Unit>> updateSearchPreferences(
      {required List<String> preferencesList}) async {
    try {
      await _settingsDataProvider.updateSearchPreferences(
          preferencesList: preferencesList);

      return right(unit);
    } on SettingsUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField about,
    required String firstNameLastValue,
    required String lastNameLastValue,
    required String aboutLastValue,
  }) async {
    try {
      await _settingsDataProvider.updateUserProfileData(
        firstName: firstName,
        lastName: lastName,
        about: about,
        firstNameLastValue: firstNameLastValue,
        lastNameLastValue: lastNameLastValue,
        aboutLastValue: aboutLastValue,
      );

      return right(unit);
    } on ProfileDataUpdateFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> uploadProfileImage({required File file}) async {
    try {
      await _settingsDataProvider.uploadProfileImage(
        file: file,
      );

      return right(unit);
    } on ProfilePictureUploadFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteAccount() async {
    try {
      await _settingsDataProvider.deleteAccount();
      return right(unit);
    } on ProfileDeletionFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
