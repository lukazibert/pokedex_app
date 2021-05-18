import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/views/game_start_view.dart';
import 'package:pokedex_app/views/game_view.dart';

enum Options { start, one, two, three }

class GameControlller extends GetxController {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('usersData');
  PokemonController pokemonController = Get.find();
  var selectedOption = Options.start.obs;
  var isHidden = true.obs;
  var currentImgIndex = 12.obs;
  var inputPokemon = ''.obs;

  //var dropdownValue = ''.obs;
  //var dropDownValue = '5'.obs;
  var currentPokemon = 0.obs;
  var nameOpacity = 1.0.obs;
  var showName = false.obs;
  var inputCorrect = false.obs;
  var answerButton = false.obs;
  var roundsCount = 0.obs;
  var pointsCount = 0.obs;
  var allowAnswer = false.obs;
  //var revealPokemon = false.obs;
  void answerButtonPressed() async {
    print('button');
    answerButton.value = true;
    Future.delayed(Duration(seconds: 1));
    answerButton.value = false;
  }

  bool next() {
    return (isHidden.value = !isHidden.value);
  }

  isCorrect() {
    if (pokemonController.pokemonList[currentImgIndex.value].name
            .toLowerCase() ==
        inputPokemon.toLowerCase()) {
      inputCorrect.value = true;
    } else {
      inputCorrect.value = false;
    }
  }

  void exit() {
    Get.back();
  }
  // void exit() {
  //   Get.off(() => GameView());
  //   Get.to(() => GameStart());
  // }

  void start() async {
    await Future.delayed(Duration(milliseconds: 600));
    roundsCount++;
    var random = Random().nextInt(150);
    if (random == currentImgIndex.value) start();

    isHidden.value = true;
    showName.value = false;
    if (random - 10 > 0) {
      for (var i = 9; i >= 0; i--) {
        currentImgIndex.value = random - i;
        //print(i);
        //print(current);
        await Future.delayed(Duration(milliseconds: 1000));
        allowAnswer.value = true;
      }
    } else {
      for (var i = 1; i < 10; i++) {
        currentImgIndex.value = random + i;
        //print(current);
        await Future.delayed(Duration(milliseconds: 600));
      }
      currentImgIndex.value = random;
      await Future.delayed(Duration(milliseconds: 1000));
      allowAnswer.value = true;
    }
  }
}
