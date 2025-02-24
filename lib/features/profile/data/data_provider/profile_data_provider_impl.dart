import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/app/data/repository/custom_claims/custom_claims_repository.dart';
import 'package:newseniiorcompaniion/core/constants/firebase_constants.dart';
import 'package:newseniiorcompaniion/core/form_models/general_field.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/profile/data/data_provider/profile_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:newseniiorcompaniion/features/profile/data/failures/profile_data_update_failure.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:newseniiorcompaniion/features/profile/data/failures/profile_picture_upload_failure.dart';

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
        "age": (DateTime.now()
                    .difference(DateTime(
                        int.parse(("1995-12-20 00:00:00".split("-").first)),
                        (int.parse("1995-12-20 00:00:00".split("-")[1])),
                        (int.parse(("1995-12-20 00:00:00".split("-")[2])
                            .split(" ")
                            .first))))
                    .inDays /
                365)
            .round(),
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
  Future<UserDetails> getUserDetails() async {
    final user = _firebaseAuth.currentUser;
    final UserDetails userDetails;
    if (user != null) {
      final userDetailsDocument = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .get()
          .then((value) {
        return UserDetails.fromJson(value.data()!);
      }).onError((error, stackTrace) {
        throw const ProfileDataUpdateFailure();
      });
      userDetails = userDetailsDocument;
    } else {
      throw const ProfileDataUpdateFailure();
    }
    return userDetails;
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
