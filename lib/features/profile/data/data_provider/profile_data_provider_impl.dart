import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/app/data/repository/custom_claims/custom_claims_repository.dart';
import 'package:seniorcompanion/core/constants/firebase_constants.dart';
import 'package:seniorcompanion/core/form_models/general_field.dart';
import 'package:seniorcompanion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/features/profile/data/failures/profile_data_update_failure.dart';

class ProfileDataProviderImpl implements ProfileDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final CustomClaimsRepository customClaimsRepository;

  ProfileDataProviderImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
    required this.customClaimsRepository,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<Unit> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField birthday,
    required GeneralField about,
    required String gender,
    required List<String> preferences,
  }) async {
    final Unit rResult;

    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final addProfileDataToUserDocument = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "firstName": firstName,
        "lastName": lastName,
        "birthday": birthday,
        "about": about,
        "gender": gender,
        "preferences": preferences,
        "profilePicURL": "",
      }).then((value) async {
        await customClaimsRepository.updateClaims({
          'profileUpdated': true,
        });
        return unit;
      }).onError((error, stackTrace) {
        throw const ProfileDataUpdateFailure();
      });
      rResult = addProfileDataToUserDocument;
    } else {
      throw const ProfileDataUpdateFailure();
    }
    return rResult;
  }
}
