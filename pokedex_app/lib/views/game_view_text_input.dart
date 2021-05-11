import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

//actual game play
class TextGameView extends StatelessWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  final GameControlller gameControlller = Get.put(GameControlller());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: Image.network(
                    pokemonController
                        .pokemonList[gameControlller.currentImgIndex.value].img,
                    scale: 0.6,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                //focusNode: gameControlller.focusNode,
                onChanged: (value) =>
                    gameControlller.inputPokemon.value = value,
                onEditingComplete: () {
                  //gameControlller.focusNode.unfocus();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: gameControlller.isCorrect()
                      ? Colors.greenAccent[100]
                      : Colors.redAccent[100],
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  border: OutlineInputBorder(
                      //borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  hintText: 'Who\'s that pokemon?',
                  //labelStyle: TextStyle(color: Colors.blue)
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)))),
              onPressed: () {
                print(gameControlller.inputPokemon.value);
                print(pokemonController
                    .pokemonList[gameControlller.currentImgIndex.value].name);
                //gameControlller.inputPokemon.value = '';
                //gameControlller.focusNode.unfocus();
              },
              child: Text('SUBMIT'),
            )
          ],
        ),
      ),
    );
  }
}
