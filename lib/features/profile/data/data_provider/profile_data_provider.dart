import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/core/form_models/general_field.dart';

abstract class ProfileDataProvider {
  Future<Unit> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField birthday,
    required GeneralField about,
    required String gender,
    required List<String> preferences,
  });
}
