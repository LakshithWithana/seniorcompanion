import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

import '../../failures/blocked_account_failure/blocked_account_failure.dart';

abstract class BlockedAccountRepository {
  Future<Either<BlockedAccountFailure, UserDetails>> getBlockedAccountStatus();
}
