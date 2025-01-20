import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/form_models/general_field.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/data_provider/emergency_data_provider.dart';
import 'package:newseniiorcompaniion/features/notifications/emergency_and_reminders/data/failures/emergency_no_update_failure.dart';

import '../../../../../core/constants/firebase_constants.dart';

class EmergencyDataProviderImpl implements EmergencyDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  EmergencyDataProviderImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<Unit> updateEmergencyCallNo(
      {required GeneralField emergencyCallNo}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "emergencyNumber": emergencyCallNo.value,
      });
      return unit;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }

  @override
  Future<Unit> updateDoctorCallNo({required GeneralField doctorCallNo}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "doctorNumber": doctorCallNo.value,
      });
      return unit;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }

  @override
  Future<Unit> updateAmbulanceCallNo(
      {required GeneralField ambulanceCallNo}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .update({
        "ambulanceNumber": ambulanceCallNo.value,
      });
      return unit;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }

  @override
  Future<String> getAmbulanceCallNo() async {
    final user = _firebaseAuth.currentUser;
    String emergencyNumber;
    if (user != null) {
      emergencyNumber = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .get()
          .then((value) {
        if (value.exists) {
          return (value.data() as dynamic)['ambulanceNumber'];
        } else {
          return "";
        }
      });
      return emergencyNumber;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }

  @override
  Future<String> getDoctorCallNo() async {
    final user = _firebaseAuth.currentUser;
    String doctorNumber;
    if (user != null) {
      doctorNumber = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .get()
          .then((value) {
        if (value.exists) {
          return (value.data() as dynamic)['doctorNumber'];
        } else {
          return "";
        }
      });
      return doctorNumber;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }

  @override
  Future<String> getEmergencyCallNo() async {
    final user = _firebaseAuth.currentUser;
    String emergencyNumber;
    if (user != null) {
      emergencyNumber = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(user.uid)
          .get()
          .then((value) {
        if (value.exists) {
          return (value.data() as dynamic)['emergencyNumber'];
        } else {
          return "";
        }
      });
      return emergencyNumber;
    } else {
      throw const EmergencyNoUpdateFailure();
    }
  }
}
