//import 'dart:html';

class UserLocal {
  final String uid;

  UserLocal({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String favPokemonIndex;
  final String bestScore;

  UserData({this.uid, this.name, this.favPokemonIndex, this.bestScore});
}
