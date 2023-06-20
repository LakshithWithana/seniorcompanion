import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/core/type_defs/type_defs.dart';

abstract class UserDetailsDataProvider {
  RvStream<UserDetails> listenToUserDetails();
}
