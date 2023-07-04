import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../models/address_model/address_model.dart';
import '../failures/location_data_failures.dart';

abstract class LocationRepository {
  Future<Either<LocationDataFailure, Unit>> checkLocationPermission();

  Future<Either<LocationDataFailure, Unit>> updateCurrentLocationOfUser(
      Position newLocation);

  Future<Either<LocationDataFailure, AddressModel>> getCurrentLocationOfUser();
}
