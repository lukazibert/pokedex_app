import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/services/auth.dart';
import 'package:pokedex_app/services/database.dart';

class AccountController extends GetxController {
  final AuthService _authServices = AuthService();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('usersData');
  var seletedIndex = 0.obs;
  var isLoggedIn = false.obs;
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;
  var _userUID = '';
  var registerButton = false.obs;
  var choseFav = false.obs;
  var selectedIndex = 0;

  register() async {
    print('register');
    dynamic result = await _authServices
        .registerWithEmailAndPassword(email.value, password.value, name.value)
        .whenComplete(() => print('register'));
    //await DatabaseService(uid: result).updateUserData(name.value, '0', '0');
    print(result.toString());
    _userUID = result;

    singIn();
  }

  // String getUserName() async{

  // }

  singIn() async {
    print('sing in called');
    // DocumentReference documentReference =
    //     FirebaseFirestore.instance.collection('SingInData').doc(email.value);

    // Map<String, dynamic> users = {
    //   'email': email.value,
    //   'password': password.value,
    // };

    // documentReference.set(users).whenComplete(() => print('user sing in'));

    dynamic result = await _authServices
        .signInWithEmailAndPassword(email.value, password.value)
        .whenComplete(() => print('singed in'));
    print(result.uid.toString());
    _userUID = result.uid;
    isLoggedIn.value = true;

    // email.value = '';
    // password.value = '';
  }

  Future<DocumentSnapshot> getData() async {
    return await users.doc(_userUID).get();
  }

  logOut() async {
    await _authServices.signOut();
    _userUID = '';
    isLoggedIn.value = false;
  }

  setNewScore(points, rounds) async {
    //print('call chaneged');
    var retrivedData;
    await users
        .doc(_userUID)
        .get()
        .then((value) => retrivedData = value.data());

    var currentScore = retrivedData['bestScore'];

    print(currentScore);

    var currentArr = currentScore.split('/');
    print(currentArr.toString());
    var curentBestScore = int.parse(currentArr[0]);
    var currentBestOutOf = int.parse(currentArr[1]);
    if ((curentBestScore / currentBestOutOf < points / rounds) ||
        currentBestOutOf + curentBestScore == 0) {
      print('score chanedged');
      await users
          .doc(_userUID)
          .update({'bestScore': '$points/$rounds'}).whenComplete(
              () => print('setting complete'));
    }

    await users
        .doc(_userUID)
        .get()
        .then((value) => retrivedData = value.data());

    var newCurrentScore = retrivedData['bestScore'];

    print(newCurrentScore);
  }

  setFavPokemon(index) async {
    print('call');
    await users
        .doc(_userUID)
        .update({'favPokemonIndex': '$index'}).whenComplete(
            () => print('setting complete'));

    choseFav.value = false;
  }
}
