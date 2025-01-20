import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newseniiorcompaniion/core/errors/exceptions/exceptions.dart';
import 'package:newseniiorcompaniion/core/loacation/data/failures/location_data_failures.dart';

import '../../../models/address_model/address_model.dart';
import '../data_provider/location_data_provider.dart';
import 'location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDataProvider _locationDataProvider;
  LocationRepositoryImpl({required LocationDataProvider locationDataProvider})
      : _locationDataProvider = locationDataProvider;
  @override
  Future<Either<LocationDataFailure, Unit>> checkLocationPermission() async {
    try {
      final result = await _locationDataProvider.checkLocationPermission();

      return right(result);
    } catch (e) {
      return left(const LocationDataFailure.locationPermission(
          "Location Services are not enabled. Enable location services to use this app's features."));
    }
  }

  @override
  Future<Either<LocationDataFailure, Unit>> updateCurrentLocationOfUser(
      Position newLocation) async {
    try {
      await _locationDataProvider.updateCurrentLocationOfUser(newLocation);

      return right(unit);
    } catch (e) {
      return left(const LocationDataFailure.locationUpdate(
          "Error occurred while updating location")); //TODO add proper error type here
    }
  }

  @override
  Future<Either<LocationDataFailure, AddressModel>>
      getCurrentLocationOfUser() async {
    try {
      return right(await _locationDataProvider.getCurrentLocationOfUser());
    } on LocationUpdateException catch (e) {
      return left(LocationDataFailure.locationUpdate(e.message));
    }
  }
}
