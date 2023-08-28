import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seniorcompanion/core/constants/firebase_constants.dart';
import 'package:seniorcompanion/core/models/user_details_model/user_details_model.dart';

import 'block_account_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class BlockAccountDataProviderImpl implements BlockAccountDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  BlockAccountDataProviderImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<UserDetails> getBlockAccountStatus() async {
    final result = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollectionName)
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      return UserDetails.fromJson(value.data()!);
    });

    //     .then((value) {
    //   return (value.data() as dynamic)['tmpBlock'];
    // });

    return result;
  }
}
