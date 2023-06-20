import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

import '../../../type_defs/type_defs.dart';

abstract class UserDetailsRepository {
  RvStream<UserDetails> listenToUserDetails();
}
