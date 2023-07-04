import 'package:geolocator/geolocator.dart';

import '../../../../core/models/address_model/address_model.dart';
import '../../../../core/type_defs/type_defs.dart';

abstract class LocationDataProvider {
  RvfUnit checkLocationPermission();

  RvfUnit updateCurrentLocationOfUser(Position newLocation);

  Rvf<AddressModel> getCurrentLocationOfUser();
}
