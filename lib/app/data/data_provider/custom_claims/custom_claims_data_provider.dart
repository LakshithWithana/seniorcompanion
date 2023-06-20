import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/core/models/sc_user/sc_user_model.dart';

import '../../../../core/custom_types/date_stamp.dart';
import '../../../../core/models/custom_claims/claims_model.dart';

abstract class CustomClaimsDataProvider {
  ///Get the custom claims document of the user
  Stream<ClaimsModel> get customClaimsModel;

  ///Set custom claims model
  Future<Unit> setClaimsModel(ClaimsModel model);

  ///Get the current user
  SCUser get currentUser;

  ///Get the last commited date . If the value does not exist DateStamp.empty is returned
  DateStamp get lastCommittedDate;

  ///Set the last commited date of claims model
  Unit setLastCommitedDate(DateStamp date);

  ///update claims
  Future<Unit> updateClaims(Map claimsData);
}
