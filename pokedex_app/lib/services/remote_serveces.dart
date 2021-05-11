import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon.dart';

class RemoteServeces {
  static var client = http.Client();
  static Future<List<Pokemon>> fetchPokemon() async {
    PokeHub pokeHub;
    var responce = await client.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));

    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      var decodedJson = jsonDecode(jsonString);
      pokeHub = PokeHub.fromJson(decodedJson);
      print(pokeHub.toString());
      return pokeHub.pokemon.map((poke) => poke).toList();
    } else {
      return null;
    }
  }
}
