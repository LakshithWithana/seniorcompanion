part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;

  const factory LocationState.loading() = _Loading;

  const factory LocationState.loaded(Position location) = _Loaded;

  const factory LocationState.locationPermissionNotGiven(String? errorMessage) =
      _LocationPermissionNotGiven;
}


// Define the states
// abstract class LocationState {}

// class LocationInitial extends LocationState {}

// class LocationEnabled extends LocationState {}

// class LocationDisabled extends LocationState {}

// class LocationError extends LocationState {
//   final String errorMessage;

//   LocationError(this.errorMessage);
// }

// class LocationUpdated extends LocationState {}