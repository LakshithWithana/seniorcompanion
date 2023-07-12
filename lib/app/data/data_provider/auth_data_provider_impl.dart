import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:seniorcompanion/app/data/data_provider/auth_data_provider.dart';
import 'package:seniorcompanion/app/data/repository/custom_claims/custom_claims_repository.dart';
import 'package:seniorcompanion/core/cache/cache.dart';
import 'package:seniorcompanion/core/constants/firebase_constants.dart';
import 'package:seniorcompanion/core/form_models/email.dart';
import 'package:seniorcompanion/core/form_models/password.dart';
import 'package:seniorcompanion/core/models/custom_claims/claims_model.dart';
import 'package:seniorcompanion/core/models/sc_user/sc_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../../core/errors/exceptions/exceptions.dart';
import '../failures/login_with_email_password_failures.dart';
import '../failures/signup_with_email_and_password_failure.dart';

class AuthDataProviderImpl implements AuthDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final CacheClient _cache;
  final CustomClaimsRepository customClaimsRepository;

  AuthDataProviderImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
    required CacheClient cache,
    required this.customClaimsRepository,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore,
        _cache = cache;

  static const userCacheKey = '__user_cache_key__';

  @override
  SCUser get currentSCUser {
    return _cache.read<SCUser>(key: userCacheKey) ?? SCUser.empty;
  }

  @override
  Future<Map<String, dynamic>?> get userClaims async {
    final user = _firebaseAuth.currentUser;

    // If refresh is set to true, a refresh of the id token is forced.
    final idTokenResult = await user?.getIdTokenResult(true);

    return idTokenResult?.claims;
  }

  @override
  Future<SCUser> getUserFromFirebaseUser(
      firebase_auth.User? firebaseUser) async {
    await Future.delayed(const Duration(milliseconds: 4000));
    final claims = (await userClaims);
    if (claims != null) {
      if (firebaseUser != null) {
        final currentUser = firebaseUser.toUser.copyWith(
          role: claims['role'],
          profileUpdated: claims['profileUpdated'],
        );
        _cache.write(key: userCacheKey, value: currentUser);

        return currentUser;
      } else {
        return SCUser.empty;
      }
    } else {
      return SCUser.empty;
    }
  }

  // @override
  // Stream<UserDetails> get currentUserDetails {
  //   return (currentSCUser.isNotEmpty)
  //       ? _firebaseFirestore
  //           .collection(FirebaseConstants.usersCollectionName)
  //           .doc(_firebaseAuth.currentUser!.uid)
  //           .snapshots()
  //           .map(_userDetailsFromSnapshot)
  //       : const Stream.empty();
  // }

  // UserDetails _userDetailsFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserDetails(
  //     uid: (snapshot.data() as dynamic)["uid"],
  //     email: (snapshot.data() as dynamic)["email"],
  //     firstName: (snapshot.data() as dynamic)["firstName"],
  //     lastName: (snapshot.data() as dynamic)["lastName"],
  //     role: (snapshot.data() as dynamic)["role"],
  //     birthday: (snapshot.data() as dynamic)["birthday"],
  //     about: (snapshot.data() as dynamic)["about"],
  //     gender: (snapshot.data() as dynamic)["gender"],
  //     preferences: (snapshot.data() as dynamic)["preferences"],
  //     profilePicURL: (snapshot.data() as dynamic)["profilePicURL"],
  //   );
  // }

  @override
  Stream<SCUser> get scUser {
    return _firebaseAuth.idTokenChanges().asyncMap(getUserFromFirebaseUser);
  }

  @override
  Future<Unit> logInWithEmailAndPassword(
      {required Email email, required Password password}) async {
    try {
      firebase_auth.UserCredential result =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      if (result.user != null) {
        firebase_auth.IdTokenResult idTokenResult =
            await result.user!.getIdTokenResult();

        Map<String, dynamic>? claims = idTokenResult.claims;

        if (claims == null) {
          throw const LogInWithEmailAndPasswordFailure();
        } else {
          return unit;
        }
      } else {
        throw const LogInWithEmailAndPasswordFailure();
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } on LogInWithEmailAndPasswordFailure catch (e) {
      throw LogInWithEmailAndPasswordFailure(e.message);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<Unit> signOutUser() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);

      return unit;
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  Future<Unit> registerWithEmailAndPassword(
      {required Email email,
      required Password password,
      required String role}) async {
    late Unit rResult;

    firebase_auth.UserCredential result =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.value, password: password.value);

    if (result.user != null) {
      final addDataToFirebaseResult = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(result.user!.uid)
          .set({
        "uid": result.user!.uid,
        "email": email.value,
        "role": role,
        "firstName": "",
        "lastName": "",
        "birthday": "",
        "about": "",
        "gender": "",
        "preferences": [],
        "profilePicURL": "",
        "lat": 0.0,
        "lon": 0.0,
        "age": 0,
        "rating": 5.0,
      }).then((value) async {
        final ClaimsModel cModel = ClaimsModel(
            userId: result.user!.uid,
            email: email.value,
            role: role,
            profileUpdated: false);
        await customClaimsRepository.setClaimsModel(cModel);
        return unit;
      }).onError((error, stackTrace) {
        throw const SignUpWithEmailAndPasswordFailure(
            "You can not sign up to consumer app with this credentials");
      });
      rResult = addDataToFirebaseResult;
    } else {
      throw const SignUpWithEmailAndPasswordFailure(
          "You can not sign up to consumer app with this credentials");
    }
    return rResult;
  }

  @override
  Future<Unit> refreshIdTokenOfTheUser() async {
    try {
      await _firebaseAuth.currentUser!.getIdToken(true);
      return unit;
    } catch (e) {
      Logger().e(e);
      throw const Exceptions.dataSourceException(
          "ErrorMessages.unexpectedErrorMessage");
    }
  }

  @override
  Stream<firebase_auth.User?> get firebaseUser =>
      _firebaseAuth.authStateChanges();
}

extension on firebase_auth.User {
  SCUser get toUser {
    return SCUser(uid: uid, email: email!, role: "", profileUpdated: false);
  }
}
