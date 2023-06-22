import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:seniorcompanion/core/models/sc_user/sc_user_model.dart';

import '../../../core/errors/failures/failures.dart';
import '../../../core/form_models/email.dart';
import '../../../core/form_models/password.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class AuthRepository {
  ///This will return the current user as a stream
  Stream<SCUser> get scUser;

  ///This will return the current user
  SCUser get currentUser;

  // Stream<UserDetails> get currentUserDetails;

  ///Signout method
  Future<Either<String, Unit>> signOutUser();

  clearValue() {
    SCUser.empty;
    Logger().w("current user value cleared");
  }

  ///Sign in method
  Future<Either<String, Unit>> loginWithEmailAndPassword(
      {required Email email, required Password password});

  ///Register method
  Future<Either<String, Unit>> registerWithEmailAndPassword(
      {required Email email, required Password password, required String role});

  ///This will return the current Firebase User as a stream
  Stream<firebase_auth.User?> get firebaseUser;

  Future<Either<Failure, Unit>> refreshIdTokenOfTheUser();
}
