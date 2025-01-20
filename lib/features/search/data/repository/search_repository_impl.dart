import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/search/data/data_provider/search_data_provider.dart';
import 'package:newseniiorcompaniion/features/search/data/failures/search_failure.dart';
import 'package:newseniiorcompaniion/features/search/data/repository/search_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataProvider _searchDataProvider;

  SearchRepositoryImpl({required SearchDataProvider searchDataProvider})
      : _searchDataProvider = searchDataProvider;
  @override
  Future<Either<String, Stream<List<UserDetails>>>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double distance,
    required String startTime,
    required String endTime,
    required String role,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = _searchDataProvider.searchUsers(
        gender: gender,
        startAge: startAge,
        endAge: endAge,
        selectedDistance: distance,
        startTime: startTime,
        endTime: endTime,
        role: role,
        prefs: prefs,
      );

      return right(result);
    } on SearchFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
