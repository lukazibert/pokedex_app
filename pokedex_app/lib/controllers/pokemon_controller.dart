import 'dart:developer';
import 'dart:ffi';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/remote_serveces.dart';

class PokemonController extends GetxController
    with SingleGetTickerProviderMixin {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;
  AnimationController controller;
  var loading = false.obs;

  @override
  void onInit() async {
    //loading.value = true;
    //final Future<FirebaseApp> initialization = Firebase.initializeApp();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    fetchPokemon();
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    //loading.value = false;
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  // @override
  // void onReady(){

  // }

  void fetchPokemon() async {
    try {
      isLoading(true);
      var pokemon = await RemoteServeces.fetchPokemon();
      if (pokemon != null) {
        pokemonList.value = pokemon;
      }
    } finally {
      await Future.delayed(Duration(seconds: 3));
      controller.dispose();
      isLoading(false);
    }
  }
}
