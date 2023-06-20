import 'package:dartz/dartz.dart';
import 'package:seniorcompanion/app/data/repository/auth_repository.dart';
import 'package:seniorcompanion/core/form_models/email.dart';
import 'package:seniorcompanion/core/form_models/password.dart';
import 'package:seniorcompanion/core/models/sc_user/sc_user_model.dart';

import '../../../core/errors/exceptions/exceptions.dart';
import '../../../core/errors/failures/failures.dart';
import '../data_provider/auth_data_provider.dart';
import '../failures/login_with_email_password_failures.dart';
import '../failures/signup_with_email_and_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataProvider _authDataProvider;
  AuthRepositoryImpl({required AuthDataProvider authDataProvider})
      : _authDataProvider = authDataProvider;

  @override
  Stream<SCUser> get scUser => _authDataProvider.scUser;

  // @override
  // Stream<UserDetails> get currentUserDetails =>
  //     _authDataProvider.currentUserDetails;

  @override
  SCUser get currentUser => _authDataProvider.currentSCUser;

  @override
  Future<Either<String, Unit>> loginWithEmailAndPassword(
      {required Email email, required Password password}) async {
    try {
      await _authDataProvider.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on LogInWithEmailAndPasswordFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> registerWithEmailAndPassword(
      {required Email email,
      required Password password,
      required String role}) async {
    try {
      await _authDataProvider.registerWithEmailAndPassword(
        email: email,
        password: password,
        role: role,
      );

      return right(unit);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      return left(e.message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signOutUser() async {
    try {
      await _authDataProvider.signOutUser();
      return right(unit);
    } on LogOutFailure {
      return left("");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<Failure, Unit>> refreshIdTokenOfTheUser() async {
    try {
      await _authDataProvider.refreshIdTokenOfTheUser();
      return right(unit);
    } on DataSourceException catch (e) {
      return left(Failure.dataSourceFailure(e.message));
    }
  }

  @override
  Stream<firebase_auth.User?> get firebaseUser =>
      _authDataProvider.firebaseUser;
}
