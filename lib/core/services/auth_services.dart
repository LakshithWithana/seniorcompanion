import 'package:firebase_auth/firebase_auth.dart';
import 'package:seniorcompanion/core/models/user_model.dart';

import 'database_services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase
  SCUser? _userFromFirebaseUser(User? user) {
    return user != null ? SCUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<SCUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // register with email and password
  Future registerWithEmailAndPassword({
    String? password,
    String? email,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      User user = result.user!;

      await DatabaseServices(uid: user.uid).updateUserData(
        email: email,
      );
      print('uid: ${user.uid}');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword({String? email, String? password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User user = result.user!;
      print('uid: ${user.uid}');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      print('Signed out');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
