import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokedex_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersDataCollection =
      FirebaseFirestore.instance.collection('usersData');

  Future<void> updateUserData(
      String name,
      String favPokemonIndex,
      String previusScore,
      String bestScore,
      String email,
      String password) async {
    return await usersDataCollection.doc(uid).set({
      'name': name,
      'favPokemonIndex': favPokemonIndex,
      'previusScore': previusScore,
      'bestScore': bestScore,
      'email': email,
      'password': password,
    });
  }
  // brew list from snapshot
  // List<UserData> _ListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc){
  //     //print(doc.data);
  //     return UserData(
  //       name: doc.data['name'] ?? '',
  //       favPokemonIndex: doc.data['favPokemonIndex'] ?? '0',
  //       bestScore: doc.data['bestScore'] ?? '0'
  //     );
  //   }).toList();
  // }

  // user data from snapshots
  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //       uid: uid,
  //       name: snapshot.data['name'],
  //       favPokemonIndex: snapshot.data['favPokemonIndex'],
  //       bestScore: snapshot.data['bestScore']);
  // }

  // get brews stream
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots()
  //     .map(_brewListFromSnapshot);
  // }

  // get user doc stream
  // Stream<UserData> get userData {
  //   return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  // }
}
