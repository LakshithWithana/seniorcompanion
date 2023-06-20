import 'package:dartz/dartz.dart';

import '../../../../core/custom_types/date_stamp.dart';
import '../../../../core/errors/failures/failures.dart';
import '../../../../core/models/custom_claims/claims_model.dart';

abstract class CustomClaimsRepository {
  ///
  Stream<ClaimsModel> get customClaimsModel;

  Future<Either<Failure, Unit>> setClaimsModel(ClaimsModel model);

  ///Get the last commited date
  DateStamp get lastCommittedDate;

  Either<Failure, Unit> setLastCommitedDate(DateStamp date);

  Future<Either<Failure, Unit>> updateClaims(Map claimsData);
}
