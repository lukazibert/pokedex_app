import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

enum Options { start, one, two, three }

class GameControlller extends GetxController {
  PokemonController pokemonController = Get.find();
  var selectedOption = Options.start.obs;
  var isHidden = false.obs;
  var currentImgIndex = 12.obs;
  var inputPokemon = ''.obs;
  //var dropdownValue = ''.obs;
  //var dropDownValue = '5'.obs;
  var currentPokemon = 0.obs;
  var nameOpacity = 1.0.obs;
  var showName = false.obs;

  bool next() {
    return (isHidden.value = !isHidden.value);
  }

  bool isCorrect() {
    if (pokemonController.pokemonList[currentImgIndex.value].name
            .toLowerCase() ==
        inputPokemon.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }

  void start() async {
    await Future.delayed(Duration(milliseconds: 600));
    var random = Random().nextInt(150);
    currentPokemon.value = random;
    isHidden.value = true;
    if (random - 10 > 0) {
      for (var i = 9; i >= 0; i--) {
        currentImgIndex.value = random - i;
        print(i);
        //print(current);
        await Future.delayed(Duration(milliseconds: 600));
      }
    } else {
      for (var i = 1; i < 10; i++) {
        currentImgIndex.value = random + i;
        //print(current);
        await Future.delayed(Duration(milliseconds: 600));
      }
      currentImgIndex.value = random;
      await Future.delayed(Duration(milliseconds: 600));
    }
    isHidden.value = false;
  }
}
