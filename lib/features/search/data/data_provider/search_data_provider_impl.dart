import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seniorcompanion/core/loacation/data/repository/location_repository.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/features/search/data/data_provider/search_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/features/search/data/failures/search_failure.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/loacation/data/failures/location_data_failures.dart';

class SearchDataProviderImpl implements SearchDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final LocationRepository locationRepository;
  final FirebaseFirestore _firebaseFirestore;

  SearchDataProviderImpl({
    required this.locationRepository,
    required FirebaseFirestore firebaseFirestore,
    required firebase_auth.FirebaseAuth firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseAuth = firebaseAuth;

  @override
  Future<List<UserDetails>> searchUsers(
      {required String gender,
      required int startAge,
      required int endAge,
      required double distance,
      required String startTime,
      required String endTime}) async {
    final List<UserDetails> rResult;
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      final search = await locationRepository
          .checkLocationPermission()
          .then((value) async {
        _firebaseFirestore
            .collection(FirebaseConstants.usersCollectionName)
            .where("age", isGreaterThan: startAge)
            .where("age", isLessThan: endAge)
            .where("gender",
                isEqualTo: gender) //TODO: check and give write gender
            .snapshots()
            .map((querySnapshot) => querySnapshot.docs
                .map((e) => UserDetails.fromJson(e.data()))
                .toList());
      }).onError((error, stackTrace) {
        throw const LocationDataFailure.locationPermission(
            "Location Permission not granted");
      });
      rResult = search;
    } else {
      throw const SearchFailure();
    }

    return rResult;
  }
}
