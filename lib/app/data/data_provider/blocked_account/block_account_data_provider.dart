import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';

abstract class BlockAccountDataProvider {
  Future<UserDetails> getBlockAccountStatus();
}
