// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:pokedex_app/services/database.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Stream<User> get user {
//     return _auth.authStateChanges();
//   }

//   Future singInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: 'barry.allen@example.com',
//               password: 'SuperSecretPassword!');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   Future registerWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User user = result.user;

//       //create a new document for the user with the uid
//       await DatabaseService(uid: user.uid).updateUserData();
//       return user.uid;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
