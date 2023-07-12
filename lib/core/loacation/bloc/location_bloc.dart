import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../data/repository/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription? _locationSubscription;
  final LocationRepository _locationRepository;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  LocationBloc({required LocationRepository locationRepository})
      : _locationRepository = locationRepository,
        super(const _Initial()) {
    on<LocationEvent>((event, emit) {
      event.whenOrNull(started: () async {
        _locationSubscription?.cancel();
        final result = await _locationRepository.checkLocationPermission();

        result.fold(
          (l) {
            emit(LocationState.locationPermissionNotGiven(l.message));
          },
          (r) {
            //
            _locationSubscription = Geolocator.getPositionStream(
              locationSettings: locationSettings,
            ).listen((Position newLocation) async {
              //check if this is a new location

              final previousLocation = state.whenOrNull(
                loaded: (location) => location,
              );
              if (previousLocation != newLocation) {
                add(LocationEvent.locationChanged(newLocation));

                final result = await _locationRepository
                    .updateCurrentLocationOfUser(newLocation);

                result.fold(
                  (l) {
                    // TODO: do something here
                  },
                  (r) {
                    // TODO: do something here
                  },
                );
              }
            });
          },
        );
      }, locationChanged: (location) {
        emit(LocationState.loaded(location));
      }, stopListening: () {
        _locationSubscription?.cancel();
        //stop updating driver locaiton on db
      });
    });
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}

extension ExLocationBLoc on BuildContext {
  LocationBloc get bloc => read<LocationBloc>();
  void addLocationEvent(LocationEvent event) => bloc.add(event);
}

// class LocationBloc extends Bloc<LocationEvent, LocationState> {
//   final LocationRepository _locationRepository;

//   LocationBloc({required LocationRepository locationRepository})
//       : _locationRepository = locationRepository,
//         super(const _Initial());

//   Stream<LocationState> mapEventToState(LocationEvent event) async* {
//     if (event is _CheckLocationPermission) {
//       yield* _mapCheckLocationEventToState();
//     } else if (event is _UpdateLocation) {
//       yield* _mapUpdateLocationEventToState(event.position);
//     }
//   }

//   Stream<LocationState> _mapCheckLocationEventToState() async* {
//     bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
//     if (isLocationEnabled) {
//       yield const LocationState.enabled();
//     } else {
//       yield const LocationState.disabled();
//     }
//     // final result = await _locationRepository.checkLocationPermission();

//     // result.fold((l) {
//     //   emit(const LocationState.disabled());
//     // }, (r) {
//     //   emit(const LocationState.enabled());
//     // });
//   }

//   Stream<LocationState> _mapUpdateLocationEventToState(
//       Position position) async* {
//     try {
//       await FirebaseFirestore.instance
//           .collection(FirebaseConstants.usersCollectionName)
//           .doc()
//           .update({
//         'lat': position.latitude,
//         'lon': position.longitude,
//       });
//       yield const _Updated();
//     } catch (e) {
//       yield const _Error("");
//     }

//     // final result =
//     //     await _locationRepository.updateCurrentLocationOfUser(position);

//     // result.fold((l) {
//     //   emit(const LocationState.error("Unable to update location"));
//     // }, (r) {
//     //   emit(const LocationState.updated());
//     // });
//   }
// }
