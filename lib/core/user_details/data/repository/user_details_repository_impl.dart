import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/core/user_details/data/repository/user_details_repository.dart';

import '../../../type_defs/type_defs.dart';
import '../data_provider/user_details_data_provider.dart';

class UserDetailsRepositoryImpl extends UserDetailsRepository {
  final UserDetailsDataProvider _userDetailsDataProvider;

  UserDetailsRepositoryImpl(
      {required UserDetailsDataProvider userDetailsDataProvider})
      : _userDetailsDataProvider = userDetailsDataProvider;
  @override
  RvStream<UserDetails> listenToUserDetails() {
    return _userDetailsDataProvider.listenToUserDetails();
  }
}
