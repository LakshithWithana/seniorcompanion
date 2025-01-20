import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:newseniiorcompaniion/app/data/data_provider/auth_data_provider.dart';
import 'package:newseniiorcompaniion/app/data/failures/login_with_apple_failure.dart';
import 'package:newseniiorcompaniion/app/data/failures/login_with_fb_failure.dart';
import 'package:newseniiorcompaniion/app/data/failures/login_with_google_failure.dart';
import 'package:newseniiorcompaniion/app/data/failures/signup_with_fb_failures.dart';
import 'package:newseniiorcompaniion/app/data/failures/signup_with_google_failure.dart';
import 'package:newseniiorcompaniion/app/data/repository/custom_claims/custom_claims_repository.dart';
import 'package:newseniiorcompaniion/core/cache/cache.dart';
import 'package:newseniiorcompaniion/core/constants/firebase_constants.dart';
import 'package:newseniiorcompaniion/core/form_models/email.dart';
import 'package:newseniiorcompaniion/core/form_models/password.dart';
import 'package:newseniiorcompaniion/core/models/custom_claims/claims_model.dart';
import 'package:newseniiorcompaniion/core/models/sc_user/sc_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../core/errors/exceptions/exceptions.dart';
import '../failures/login_with_email_password_failures.dart';
import '../failures/signup_with_email_and_password_failure.dart';
import 'package:http/http.dart' as http;

class AuthDataProviderImpl implements AuthDataProvider {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final CacheClient _cache;
  final CustomClaimsRepository customClaimsRepository;
  final GoogleSignIn _googleSignIn;

  AuthDataProviderImpl({
    required firebase_auth.FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
    required GoogleSignIn googleSignIn,
    required CacheClient cache,
    required this.customClaimsRepository,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore,
        _googleSignIn = googleSignIn,
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
          // role: "CG",
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
  Future<Unit> logInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        firebase_auth.UserCredential result =
            await _firebaseAuth.signInWithCredential(credential);

        if (result.user != null) {
          firebase_auth.IdTokenResult idTokenResult =
              await result.user!.getIdTokenResult();

          Map<String, dynamic>? claims = idTokenResult.claims;

          if (claims == null) {
            throw const LogInWithGoogleFailure(
                "Your signup was not successful.");
          } else {
            return unit;
          }
        } else {
          throw const LogInWithGoogleFailure("We cannot find your account.");
        }
      } else {
        throw const LogInWithGoogleFailure(
            "You're not signed up using Google account");
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } on LogInWithGoogleFailure catch (e) {
      throw LogInWithGoogleFailure(e.message);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<Unit> logInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      if (userData.isNotEmpty) {
        final signInMethods = Platform.isIOS
            ? await _firebaseAuth
                .fetchSignInMethodsForEmail(userData.values.elementAt(0))
            : await _firebaseAuth
                .fetchSignInMethodsForEmail(userData.values.elementAt(1));
        if (signInMethods.isNotEmpty) {
          if (result.status == LoginStatus.success) {
            final AccessToken accessToken = result.accessToken!;
            final AuthCredential credential =
                FacebookAuthProvider.credential(accessToken.tokenString);

            final UserCredential userCredential =
                await _firebaseAuth.signInWithCredential(credential);

            if (userCredential.user != null) {
              final IdTokenResult idTokenResult =
                  await userCredential.user!.getIdTokenResult();

              final Map<String, dynamic>? claims = idTokenResult.claims;

              if (claims == null) {
                throw const LogInWithFacebookFailure(
                    "Your login was not successful.");
              } else {
                return unit;
              }
            } else {
              throw const LogInWithFacebookFailure(
                  "We cannot find your account.");
            }
          } else if (result.status == LoginStatus.cancelled) {
            throw const LogInWithFacebookFailure(
                "You cancelled the login process.");
          } else {
            throw const LogInWithFacebookFailure(
                "An error occurred during the login process.");
          }
        } else {
          throw const LogInWithFacebookFailure("We cannot find your account.");
        }
      } else {
        throw const LogInWithFacebookFailure(
            "We cannot login via Facebook. Please try again.");
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithFacebookFailure(e.code);
    } on LogInWithFacebookFailure catch (e) {
      throw LogInWithFacebookFailure(e.message);
    } catch (_) {
      throw const LogInWithFacebookFailure();
    }
  }

  @override
  Future<Unit> logInWithApple() async {
    try {
      // Request Apple ID credentials
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final String? email = credential.email;
      if (email != null) {
        final signInMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (signInMethods.isNotEmpty) {
          // Create an OAuthProvider with 'apple.com' as the provider ID
          final provider = firebase_auth.OAuthProvider('apple.com');

          // Attach the Apple ID token to the provider
          final authCredential = provider.credential(
            idToken: credential.identityToken,
            accessToken: credential.authorizationCode,
          );

          // Authenticate with Firebase using the Apple credentials
          firebase_auth.UserCredential result =
              await _firebaseAuth.signInWithCredential(authCredential);

          if (result.user != null) {
            firebase_auth.IdTokenResult idTokenResult =
                await result.user!.getIdTokenResult();

            Map<String, dynamic>? claims = idTokenResult.claims;

            if (claims == null) {
              throw const LogInWithAppleFailure(
                  "Your signup was not successful.");
            } else {
              return unit;
            }
          } else {
            throw const LogInWithAppleFailure("We cannot find your account.");
          }
        } else {
          throw const LogInWithAppleFailure("We cannot find your account.");
        }
      } else {
        throw const LogInWithAppleFailure("We cannot find your account.");
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithAppleFailure.fromCode(e.code);
    } on LogInWithAppleFailure catch (e) {
      throw LogInWithAppleFailure(e.message);
    } catch (_) {
      throw const LogInWithAppleFailure();
    }
  }

  @override
  Future<Unit> signOutUser() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
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
        "chatUserList": [],
        "emergencyNumber": "",
        "doctorNumber": "",
        "ambulanceNumber": "",
        "tmpBlock": false,
        "pmtBlock": false,
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
            "You can not sign up to app with this credentials");
      });
      rResult = addDataToFirebaseResult;
    } else {
      throw const SignUpWithEmailAndPasswordFailure(
          "You can not sign up to app with this credentials");
    }
    return rResult;
  }

  @override
  Future<Unit> registerWithGoogle({required String role}) async {
    late Unit rResult;

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    // if (googleSignInAccount == null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    firebase_auth.UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);

    if (result.user != null) {
      final addDataToFirebaseResult = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(result.user!.uid)
          .set({
        "uid": result.user!.uid,
        "email": result.user!.email,
        "role": role,
        "firstName": result.user!.displayName != null
            ? result.user!.displayName!.split(' ')[0]
            : "",
        "lastName": result.user!.displayName != null
            ? result.user!.displayName!.split(' ')[1]
            : "",
        "birthday": "",
        "about": "",
        "gender": "",
        "preferences": [],
        "profilePicURL": result.user!.photoURL,
        "lat": 0.0,
        "lon": 0.0,
        "age": 0,
        "rating": 5.0,
        "chatUserList": [],
        "emergencyNumber": "",
        "doctorNumber": "",
        "ambulanceNumber": "",
        "tmpBlock": false,
        "pmtBlock": false,
      }).then((value) async {
        final ClaimsModel cModel = ClaimsModel(
            userId: result.user!.uid,
            email: result.user!.email,
            role: role,
            profileUpdated: false);
        await customClaimsRepository.setClaimsModel(cModel);
        return unit;
      }).onError((error, stackTrace) {
        throw SignUpWithGoogleFailure(
            "You can not sign up to app with this credentials");
      });
      rResult = addDataToFirebaseResult;
    } else {
      throw SignUpWithGoogleFailure(
          "You can not sign up to app with this credentials");
    }
    // } else {
    //   throw const SignUpWithEmailAndPasswordFailure(
    //       "You are already signed up using Google credentials, use Login.");
    // }

    return rResult;
  }

  @override
  Future<Unit> registerWithFacebook({required String role}) async {
    late Unit rResult;
    try {
      final LoginResult result =
          await FacebookAuth.instance.login(permissions: ['public_profile']);
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.tokenString);
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookCredential);
          final facebookUserData = await FacebookAuth.instance.getUserData();

          // Split the full name into first name and last name
          List<String> nameParts = userCredential.user!.displayName != null
              ? userCredential.user!.displayName!.split(' ')
              : [];

          // Extract first name and last name
          String firstName =
              userCredential.user!.displayName != null ? nameParts[0] : "";
          String lastName = nameParts.length > 1 ? nameParts[1] : '';

          final graphResponse = await http.get(Uri.parse(
              'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${result.accessToken!.tokenString}'));

          final addDataToFirebaseResult = await _firebaseFirestore
              .collection(FirebaseConstants.usersCollectionName)
              .doc(userCredential.user!.uid)
              .set({
            "uid": userCredential.user!.uid,
            "email": userCredential.user!.email,
            "role": role,
            "firstName": firstName,
            "lastName": lastName,
            "birthday": "",
            "about": "",
            "gender": "",
            "preferences": [],
            "profilePicURL": userCredential.user!.photoURL,
            "lat": 0.0,
            "lon": 0.0,
            "age": 0,
            "rating": 5.0,
            "chatUserList": [],
            "emergencyNumber": "",
            "doctorNumber": "",
            "ambulanceNumber": "",
            "tmpBlock": false,
            "pmtBlock": false,
          }).then((value) async {
            final ClaimsModel cModel = ClaimsModel(
                userId: userCredential.user!.uid,
                email: userCredential.user!.email,
                role: role,
                profileUpdated: false);
            await customClaimsRepository.setClaimsModel(cModel);
            return unit;
          }).onError((error, stackTrace) {
            throw const SignUpWithEmailAndPasswordFailure(
                "You can not sign up to app with this credentials");
          });
          rResult = addDataToFirebaseResult;
          break;
        case LoginStatus.cancelled:
          throw SignUpWithFacebookFailure("Login cancelled");
        case LoginStatus.failed:
          throw SignUpWithFacebookFailure("Login failed");
        default:
          throw SignUpWithFacebookFailure("Unknown error occurred");
      }
    } on FirebaseAuthException {
      rethrow;
    }
    return rResult;
  }

  @override
  Future<Unit> registerWithApple({required String role}) async {
    late Unit rResult;
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final String? email = appleCredential.email;
    final String? givenName = appleCredential.givenName;
    final String? familyName = appleCredential.familyName;

    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print(appleCredential.state);

      final addDataToFirebaseResult = await _firebaseFirestore
          .collection(FirebaseConstants.usersCollectionName)
          .doc(userCredential.user!.uid)
          .set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email,
        "role": role,
        "firstName": givenName ?? "",
        "lastName": familyName ?? "",
        "birthday": "",
        "about": "",
        "gender": "",
        "preferences": [],
        "profilePicURL": userCredential.user!.photoURL ?? "",
        "lat": 0.0,
        "lon": 0.0,
        "age": 0,
        "rating": 5.0,
        "chatUserList": [],
        "emergencyNumber": "",
        "doctorNumber": "",
        "ambulanceNumber": "",
        "tmpBlock": false,
        "pmtBlock": false,
      }).then((value) async {
        final ClaimsModel cModel = ClaimsModel(
            userId: userCredential.user!.uid,
            email: userCredential.user!.email,
            role: role,
            profileUpdated: false);
        await customClaimsRepository.setClaimsModel(cModel);
        return unit;
      }).onError((error, stackTrace) {
        throw const SignUpWithEmailAndPasswordFailure(
            "You can not sign up to app with this credentials");
      });
      rResult = addDataToFirebaseResult;
    } on FirebaseAuthException {
      rethrow;
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
    return SCUser(
      uid: uid,
      email: email!,
      role: "",
      profileUpdated: false,
      tmpBlock: false,
      pmtBlock: false,
    );
  }
}
