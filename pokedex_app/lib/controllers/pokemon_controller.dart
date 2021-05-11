import 'dart:developer';
import 'package:get/state_manager.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/remote_serveces.dart';

class PokemonController extends GetxController {
  var isLoading = true.obs;
  var pokemonList = <Pokemon>[].obs;

  @override
  void onInit() {
    fetchPokemon();
    super.onInit();
  }

  void fetchPokemon() async {
    try {
      isLoading(true);
      var pokemon = await RemoteServeces.fetchPokemon();
      if (pokemon != null) {
        pokemonList.value = pokemon;
      }
    } finally {
      isLoading(false);
    }
  }
}
