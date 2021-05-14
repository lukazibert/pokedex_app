import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_app/models/user.dart';

import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserLocal _userFromFirebaseUser(User user) {
    return user != null ? UserLocal(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserLocal> get user {
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        return UserLocal(uid: user.uid);
      }
    });
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    print('sing in auth');
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print('error auth');
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(name, '', '0/0', email, password);
      return user.uid;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
