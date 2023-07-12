part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;

  const factory LocationEvent.locationChanged(Position location) =
      _LocationChanged;

  const factory LocationEvent.stopListening() = _StopListening;
}

// Define the events
// abstract class LocationEvent {}

// class CheckLocationEvent extends LocationEvent {}

// class UpdateLocationEvent extends LocationEvent {
//   final Position position;

//   UpdateLocationEvent(this.position);
// }