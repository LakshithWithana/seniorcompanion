import 'package:dartz/dartz.dart';
import 'package:newseniiorcompaniion/core/form_models/email.dart';
import 'package:newseniiorcompaniion/core/form_models/password.dart';
import 'package:newseniiorcompaniion/core/models/sc_user/sc_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

abstract class AuthDataProvider {
  Stream<SCUser> get scUser;

  SCUser get currentSCUser;

  Future<Map<dynamic, dynamic>?> get userClaims;

  // Stream<UserDetails> get currentUserDetails;

  Future<Unit> logInWithEmailAndPassword(
      {required Email email, required Password password});

  Future<Unit> logInWithGoogle();

  Future<Unit> logInWithFacebook();

  Future<Unit> logInWithApple();

  Future<Unit> registerWithEmailAndPassword(
      {required Email email, required Password password, required String role});

  Future<Unit> registerWithGoogle({required String role});

  Future<Unit> registerWithFacebook({required String role});

  Future<Unit> registerWithApple({required String role});

  Future<SCUser> getUserFromFirebaseUser(firebase_auth.User firebaseUser);

  Future<Unit> signOutUser();

  Stream<firebase_auth.User?> get firebaseUser;

  /// Refresh id token of the user
  Future<Unit> refreshIdTokenOfTheUser();
}
