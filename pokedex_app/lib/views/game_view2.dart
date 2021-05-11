import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

class GameView extends StatelessWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  final GameControlller gameControlller = Get.put(GameControlller());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Obx(() => AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: gameControlller.isHidden.value
                        ? ColorFiltered(
                            child: Image.network(
                                pokemonController.pokemonList[10].img),
                            colorFilter: ColorFilter.mode(
                                Colors.blue[900], BlendMode.srcATop),
                          )
                        : Image.network(pokemonController.pokemonList[10].img),
                  ))),
          Flexible(
            flex: 4,
            fit: FlexFit.loose,
            child: Obx(
              () => Column(
                children: [
                  RadioListTile(
                      title: Text(
                        pokemonController.pokemonList[0].name + '  ?',
                        style: TextStyle(fontFamily: 'Pocket-Monk'),
                      ),
                      value: Options.one,
                      groupValue: gameControlller.selectedOption.value,
                      onChanged: (value) {
                        gameControlller.selectedOption.value = value;
                        gameControlller.isHidden.value = true;
                      }),
                  RadioListTile(
                      title: Text(pokemonController.pokemonList[1].name),
                      value: Options.two,
                      groupValue: gameControlller.selectedOption.value,
                      onChanged: (value) {
                        gameControlller.selectedOption.value = value;
                        gameControlller.isHidden.value = false;
                      }),
                  RadioListTile(
                      title: Text(pokemonController.pokemonList[2].name),
                      value: Options.three,
                      groupValue: gameControlller.selectedOption.value,
                      onChanged: (value) {
                        gameControlller.selectedOption.value = value;
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
