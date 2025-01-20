import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/form_models/general_field.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:newseniiorcompaniion/features/profile/data/failures/profile_data_update_failure.dart';
import 'package:newseniiorcompaniion/features/profile/data/failures/profile_picture_upload_failure.dart';
import 'package:newseniiorcompaniion/features/profile/data/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataProvider _profileDataProvider;

  ProfileRepositoryImpl({required ProfileDataProvider profileDataProvider})
      : _profileDataProvider = profileDataProvider;
  @override
  Future<Either<String, Unit>> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required String birthday,
    required GeneralField about,
    required String gender,
    required List<String> preferences,
  }) async {
    try {
      await _profileDataProvider.updateUserProfileData(
        firstName: firstName,
        lastName: lastName,
        birthday: birthday,
        about: about,
        gender: gender,
        preferences: preferences,
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
      await _profileDataProvider.uploadProfileImage(
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
  Future<Either<String, UserDetails>> getUserDetails() async {
    try {
      final userDetails = await _profileDataProvider.getUserDetails();
      return right(userDetails);
    } catch (e) {
      return left(e.toString());
    }
  }
}
