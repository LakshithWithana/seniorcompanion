import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SearchDataProvider {
  Stream<List<UserDetails>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double selectedDistance,
    required String startTime,
    required String endTime,
    required String role,
    required SharedPreferences prefs,
  });
}
