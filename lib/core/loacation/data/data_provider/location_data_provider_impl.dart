import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seniorcompanion/core/constants/firebase_constants.dart';
import 'package:seniorcompanion/core/models/address_model/address_model.dart';
import 'package:seniorcompanion/core/type_defs/type_defs.dart';

import '../../../../core/errors/exceptions/exceptions.dart';
import 'location_data_provider.dart';

class LocationDataProviderImpl implements LocationDataProvider {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  LocationDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;
  @override
  RvfUnit checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw const Exceptions.locationServicesNotEnabled(
          "Location services are not enabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw const Exceptions.locationPermissionNotGiven(
            "Location permission is denied");
      } else if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return unit;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      throw const Exceptions.locationPermissionNotGiven(
          "Location permission is denied forever");
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return unit;
    } else {
      throw const Exceptions.locationPermissionNotGiven(
          "Location permission is denied");
    }
  }

  @override
  RvfUnit updateCurrentLocationOfUser(Position newLocation) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await _firebaseFirestore
            .collection(FirebaseConstants.usersCollectionName)
            .doc(user.uid)
            .update({
          'lat': newLocation.latitude,
          'lon': newLocation.longitude,
        });

        return unit;
      } catch (e) {
        throw const Exceptions.locationUpdate(
            "Error occurred while updating the location of the user"); //TODO add this in a separate error message
      }
    } else {
      throw const Exceptions.locationUpdate(
          "Error occurred while updating the location of the user");
    }
  }

  @override
  Rvf<AddressModel> getCurrentLocationOfUser() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return AddressModel.empty
          .copyWith(latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      throw const Exceptions.locationUpdate(
          "Error occurred while loading location of the driver");
    }
  }
}
