import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/features/search/data/data_provider/search_data_provider.dart';
import 'package:seniorcompanion/features/search/data/failures/search_failure.dart';
import 'package:seniorcompanion/features/search/data/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataProvider _searchDataProvider;

  SearchRepositoryImpl({required SearchDataProvider searchDataProvider})
      : _searchDataProvider = searchDataProvider;
  @override
  Future<Either<String, List<UserDetails>>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double distance,
    required String startTime,
    required String endTime,
  }) async {
    try {
      final result = await _searchDataProvider.searchUsers(
          gender: gender,
          startAge: startAge,
          endAge: endAge,
          distance: distance,
          startTime: startTime,
          endTime: endTime);

      return right(result);
    } on SearchFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
