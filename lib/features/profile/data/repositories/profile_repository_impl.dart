import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/core/form_models/general_field.dart';
import 'package:seniorcompanion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:seniorcompanion/features/profile/data/failures/profile_data_update_failure.dart';
import 'package:seniorcompanion/features/profile/data/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataProvider _profileDataProvider;

  ProfileRepositoryImpl({required ProfileDataProvider profileDataProvider})
      : _profileDataProvider = profileDataProvider;
  @override
  Future<Either<String, Unit>> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField birthday,
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
}
