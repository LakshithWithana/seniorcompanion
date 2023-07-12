import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';
import 'package:seniorcompanion/features/search/data/data_provider/search_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:seniorcompanion/features/search/data/failures/search_failure.dart';
import '../../../../core/constants/firebase_constants.dart';

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
    required double distance,
    required String startTime,
    required String endTime,
    required String role,
  }) {
    final Stream<List<UserDetails>> rResult;
    final user = _firebaseAuth.currentUser;

    if (user != null) {
      final search = _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .where("age", isGreaterThanOrEqualTo: startAge)
          .where("age", isLessThanOrEqualTo: endAge)
          // .where("email", isNotEqualTo: user.email)
          .where("role", isEqualTo: role == "CR" ? "CG" : "CR")
          .where("gender",
              isEqualTo: gender == "anyone"
                  ? null
                  : gender) //TODO: check and give right gender
          .snapshots()
          .map((querySnapshot) => querySnapshot.docs
              .map((e) => UserDetails.fromJson(e.data()))
              .toList());

      rResult = search;
    } else {
      throw const SearchFailure();
    }

    return rResult;
  }
}
