import 'package:freezed_annotation/freezed_annotation.dart';
part 'exceptions.freezed.dart';

@freezed
class Exceptions with _$Exceptions implements Exception {
  ///This is thrown when there are issues in Firebase
  const factory Exceptions.dataSourceException(String message,
      [String? devLogs]) = DataSourceException;

  ///This is thrown when there are issues in Firebase
  const factory Exceptions.customClaimsException(String message,
      [String? devLogs]) = CustomClaimsException;

  ///Thrown when there is a  exception in Cache
  const factory Exceptions.cacheException(String message, [String? devLogs]) =
      CacheException;
}
