import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/features/settings/data/data_providers/settings_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/features/settings/data/failures/settings_update_failure.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/form_models/general_field.dart';
import '../../../profile/data/failures/profile_data_update_failure.dart';
import '../../../profile/data/failures/profile_picture_upload_failure.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SettingsDataProviderImpl implements SettingsDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  SettingsDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<Unit> updateSearchPreferences(
      {required List<String> preferencesList}) async {
    final Unit rResult;

    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final addPreferencesListToUserDocument = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "preferences": preferencesList,
      }).then((value) async {
        return unit;
      }).onError((error, stackTrace) {
        throw const SettingsUpdateFailure();
      });
      rResult = addPreferencesListToUserDocument;
    } else {
      throw const SettingsUpdateFailure();
    }
    return rResult;
  }

  @override
  Future<Unit> updateUserProfileData({
    required GeneralField firstName,
    required GeneralField lastName,
    required GeneralField about,
  }) async {
    final Unit rResult;

    final user = _firebaseAuth.currentUser;
    if (user != null) {
      // if(firstName.value != ""){

      // }
      final addProfileDataToUserDocument = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "firstName": firstName.value,
        "lastName": lastName.value,
        "about": about.value,
      }).then((value) async {
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
