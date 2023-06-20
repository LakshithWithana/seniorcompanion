import 'package:dartz/dartz.dart';

import '../../../../core/custom_types/date_stamp.dart';
import '../../../../core/errors/exceptions/exceptions.dart';
import '../../../../core/errors/failures/failures.dart';
import '../../../../core/models/custom_claims/claims_model.dart';
import '../../data_provider/custom_claims/custom_claims_data_provider.dart';
import 'custom_claims_repository.dart';

class CustomClaimsRepositoryImpl extends CustomClaimsRepository {
  final CustomClaimsDataProvider customClaimsDataProvider;

  CustomClaimsRepositoryImpl({
    required this.customClaimsDataProvider,
  });
  @override
  Stream<ClaimsModel> get customClaimsModel =>
      customClaimsDataProvider.customClaimsModel;

  @override
  Future<Either<Failure, Unit>> setClaimsModel(ClaimsModel model) async {
    try {
      await customClaimsDataProvider.setClaimsModel(model);

      return right(unit);
    } on CustomClaimsException catch (e) {
      return left(CustomClaimsFailure(e.message));
    } catch (e) {
      return left(
          const CustomClaimsFailure('ErrorMessages.unexpectedErrorMessage'));
    }
  }

  @override
  DateStamp get lastCommittedDate => customClaimsDataProvider.lastCommittedDate;

  @override
  Either<Failure, Unit> setLastCommitedDate(DateStamp date) {
    try {
      return right(customClaimsDataProvider.setLastCommitedDate(date));
    } on CacheException catch (e) {
      return left(Failure.cacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateClaims(Map claimsData) async {
    try {
      return right(await customClaimsDataProvider.updateClaims(claimsData));
    } on CustomClaimsException catch (e) {
      return left(Failure.customClaimsFailure(e.message));
    }
  }
}
