import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newseniiorcompaniion/core/models/user_details_model/user_details_model.dart';
import 'package:newseniiorcompaniion/core/user_details/data/data_provider/user_details_data_provider.dart';

import '../../../constants/firebase_constants.dart';
import '../../../type_defs/type_defs.dart';

class UserDetailsDataProviderImpl extends UserDetailsDataProvider {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  UserDetailsDataProviderImpl(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore})
      : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  RvStream<UserDetails> listenToUserDetails() {
    try {
      return _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(_firebaseAuth.currentUser!.uid)
          .snapshots()
          .map((docSnap) => docSnap.exists
              ? UserDetails.fromJson(docSnap.data()!)
              : UserDetails
                  .empty); //TODO check how errors are handled in this stream
      //TODO use rx dart to handle errors
    } catch (e) {
      return Stream.value(UserDetails.empty);
    }
  }
}
