import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.dataSourceFailure(String message) = DataSourceFailure;

  ///Cache failure is returned when there is a exception in Cache

  const factory Failure.cacheFailure(String message) = CacheFailure;

  const factory Failure.customClaimsFailure(String message) =
      CustomClaimsFailure;
}
