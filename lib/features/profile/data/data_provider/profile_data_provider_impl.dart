import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/app/data/repository/custom_claims/custom_claims_repository.dart';
import 'package:seniorcompanion/core/constants/firebase_constants.dart';
import 'package:seniorcompanion/core/form_models/general_field.dart';
import 'package:seniorcompanion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/features/profile/data/failures/profile_data_update_failure.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:seniorcompanion/features/profile/data/failures/profile_picture_upload_failure.dart';

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
    required String birthday,
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
        "firstName": firstName.value,
        "lastName": lastName.value,
        "birthday": birthday,
        "about": about.value,
        "gender": gender,
        "preferences": preferences,
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

  @override
  Future<Unit> uploadProfileImage({required File file}) async {
    final user = _firebaseAuth.currentUser;
    final Unit rResult;
    if (user != null) {
      // final fileName = basename(file.path);

      final ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('/${user.uid}');
      final uploadPhoto = await ref.putFile(file).then((p0) async {
        var url = await ref.getDownloadURL();
        await _firebaseFirestore
            .collection(FirebaseConstants.usersCollectionName)
            .doc(user.uid)
            .update({
          "profilePicURL": url.toString(),
        });
        return unit;
      }).onError((error, stackTrace) {
        throw const ProfilePictureUploadFailure();
      });
      rResult = uploadPhoto;
    } else {
      throw const ProfilePictureUploadFailure();
    }
    return rResult;
  }
}
