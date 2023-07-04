part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;

  const factory LocationEvent.locationChanged(Position location) =
      _LocationChanged;

  ///When the driver is not working we dont have to listen to the location
  const factory LocationEvent.stopListening() = _StopListening;
}
