import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/app/data/data_provider/blocked_account/block_account_data_provider.dart';
import 'package:newseniiorcompaniion/app/data/failures/blocked_account_failure/blocked_account_failure.dart';
import 'package:newseniiorcompaniion/app/data/repository/blocked_account/blocked_account_repository.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';

class BlockedAccountRepositoryImpl implements BlockedAccountRepository {
  final BlockAccountDataProvider blockAccountDataProvider;

  BlockedAccountRepositoryImpl(this.blockAccountDataProvider);
  @override
  Future<Either<BlockedAccountFailure, UserDetails>>
      getBlockedAccountStatus() async {
    try {
      return right(await blockAccountDataProvider.getBlockAccountStatus());
    } on BlockedAccountFailure catch (e) {
      return left(BlockedAccountFailure(e.message));
    }
  }
}
