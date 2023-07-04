import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_data_failures.freezed.dart';

@freezed
class LocationDataFailure with _$LocationDataFailure {
  ///LocationRequestFailure failure is returned when there is a  LocationRequestException
  const factory LocationDataFailure.locationRequest(String message) =
      LocationRequestFailure;

  ///LocationPermission failure is returned when there is a  LocationPermissionException
  const factory LocationDataFailure.locationPermission(String message) =
      LocationPermissionFailure;

  // locationUpdate

  ///LocationUpdate failure is returned when there is a  LocationUpdateException
  const factory LocationDataFailure.locationUpdate(String message) =
      LocationUpdateFailure;
}
