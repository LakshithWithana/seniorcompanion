import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

abstract class SearchDataProvider {
  Stream<List<UserDetails>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double distance,
    required String startTime,
    required String endTime,
    required String role,
  });
}
