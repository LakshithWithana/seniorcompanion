import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/features/search/data/data_provider/search_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:newseniiorcompaniion/features/search/data/failures/search_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/firebase_constants.dart';
import 'dart:math' show asin, cos, pi, pow, sin, sqrt;

class SearchDataProviderImpl implements SearchDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  SearchDataProviderImpl({
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Stream<List<UserDetails>> searchUsers({
    required String gender,
    required int startAge,
    required int endAge,
    required double selectedDistance,
    required String startTime,
    required String endTime,
    required String role,
    required SharedPreferences prefs,
  }) {
    final Stream<List<UserDetails>> rResult;
    final user = _firebaseAuth.currentUser;

    final double? myLat = prefs.getDouble('lat');
    final double? myLong = prefs.getDouble('lon');

    double _toRadians(double degrees) => degrees * pi / 180;

    num _haversin(double radians) => pow(sin(radians / 2), 2);

    double distanceCalculator(
        double lat1, double lon1, double lat2, double lon2) {
      const r = 6372.8; // Earth radius in kilometers

      final dLat = _toRadians(lat2 - lat1);
      final dLon = _toRadians(lon2 - lon1);
      final lat1Radians = _toRadians(lat1);
      final lat2Radians = _toRadians(lat2);

      final a = _haversin(dLat) +
          cos(lat1Radians) * cos(lat2Radians) * _haversin(dLon);
      final c = 2 * asin(sqrt(a));

      return r * c;
    }

    if (user != null) {
      final search = _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .where("age", isGreaterThanOrEqualTo: startAge)
          .where("age", isLessThanOrEqualTo: endAge)
          // .where("email", isNotEqualTo: user.email)
          .where("role", isEqualTo: role == "CR" ? "CG" : "CR")
          .where("gender", isEqualTo: gender == "anyone" ? null : gender)
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((e) => UserDetails.fromJson(e.data()))
              .toList());

      // Filter users based on distance
      Stream<List<UserDetails>> filteredUsersStream = search.map((users) {
        return users.where((user) {
          double distance = distanceCalculator(
            myLat!,
            myLong!,
            user.lat,
            user.lon,
          );

          // Set your distance threshold here (e.g., 10.0 for 10 kilometers)
          double maxDistance = selectedDistance;

          return distance <= maxDistance;
        }).toList();
      });

      rResult = filteredUsersStream;
    } else {
      throw const SearchFailure();
    }

    return rResult;
  }
}
