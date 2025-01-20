import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/form_models/general_field.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';

abstract class ProfileDataProvider {
  Future<Unit> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required String birthday,
    required GeneralField about,
    required String gender,
    required List<String> preferences,
  });

  Future<Unit> uploadProfileImage({required File file});

  Future<UserDetails> getUserDetails();
}
