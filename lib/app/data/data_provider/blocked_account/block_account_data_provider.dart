import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

abstract class BlockAccountDataProvider {
  Future<UserDetails> getBlockAccountStatus();
}
