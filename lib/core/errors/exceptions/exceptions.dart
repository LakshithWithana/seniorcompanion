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

  ///This is thrown when there is a  exception when requesting location permission

  const factory Exceptions.locationPermissionRequest(String message,
      [String? devLogs]) = LocationPermissionRequestException;

  ///This is thrown when location permission is not given

  const factory Exceptions.locationPermissionNotGiven(String message,
      [String? devLogs]) = LocationPermissionNotGivenException;

  ///This is thrown when location services are not enabled

  const factory Exceptions.locationServicesNotEnabled(String message,
      [String? devLogs]) = LocationServicesNotEnabledException;

  ///This is thrown when updating driver location

  const factory Exceptions.locationUpdate(String message, [String? devLogs]) =
      LocationUpdateException;
}
