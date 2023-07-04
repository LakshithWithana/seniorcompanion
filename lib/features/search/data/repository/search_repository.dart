import 'package:dartz/dartz.dart';

import '../../../../core/models/user_details_model/user_details_model.dart';

abstract class SearchRepository {
  Future<Either<String, List<UserDetails>>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double distance,
    required String startTime,
    required String endTime,
  });
}
