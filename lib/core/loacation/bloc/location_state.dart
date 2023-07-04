part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;

  const factory LocationState.loading() = _Loading;

  const factory LocationState.loaded(Position location) = _Loaded;

  const factory LocationState.locationPermissionNotGiven(String? errorMessage) =
      _LocationPermissionNotGiven;
}
