import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/core/cache/cache.dart';
import 'package:seniorcompanion/core/models/sc_user/sc_user_model.dart';

import '../../../../core/custom_types/date_stamp.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/models/custom_claims/claims_model.dart';
import '../../../../core/utils/linked_hash_map_to_map_coverter.dart';
import 'custom_claims_data_provider.dart';

class CustomClaimsDataProviderImpl extends CustomClaimsDataProvider {
  final CacheClient _cache;
  final FirebaseFirestore _firebaseFirestore;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  static const claimsDateCacheKey = '__claims_cache_key__';
  static const userCacheKey = '__user_cache_key__';

  CustomClaimsDataProviderImpl({
    required CacheClient cacheClient,
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
  })  : _cache = cacheClient,
        _firebaseFirestore = firebaseFirestore,
        _firebaseAuth =
            firebaseAuth; //TODO remove the dependency of firebase_auth
  @override
  Stream<ClaimsModel> get customClaimsModel => _firebaseFirestore
      .collection('user-claims')
      .doc(_firebaseAuth.currentUser!.uid)
      .snapshots()
      .map(
        (claimDoc) => claimDoc.exists
            ? ClaimsModel.fromJson(claimDoc.data()!)
            : ClaimsModel.empty,
      );

  @override
  Future<Unit> setClaimsModel(ClaimsModel model) async {
    try {
      await _firebaseFirestore
          .collection('user-claims')
          .doc(model.userId)
          .set(model.toJson());

      return unit;
    } catch (e) {
      throw const Exceptions.customClaimsException(
          "ErrorMessages.unexpectedErrorMessage");
    }
  }

  @override
  SCUser get currentUser {
    return _cache.read<SCUser>(key: userCacheKey) ?? SCUser.empty;
  }

  @override
  DateStamp get lastCommittedDate =>
      _cache.read<DateStamp>(key: claimsDateCacheKey) ?? DateStamp.empty;

  @override
  Unit setLastCommitedDate(DateStamp date) {
    try {
      _cache.write(key: claimsDateCacheKey, value: date);
      return unit;
    } catch (e) {
      throw const Exceptions.cacheException('ErrorMessages.cacheErrorMessage');
    }
  }

  @override
  Future<Unit> updateClaims(Map claimsData) async {
    try {
      await _firebaseFirestore
          .collection('user-claims')
          .doc(_firebaseAuth.currentUser!.uid)
          .update(linkedHashMapToMapCoverter(claimsData));

      return unit;
    } catch (e) {
      throw const Exceptions.customClaimsException(
          "Error occurred while updating claims");
    }
  }
}
