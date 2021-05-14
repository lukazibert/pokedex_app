import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/home_page_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

class PokemonGridView extends StatelessWidget {
  final PokemonController pokemonController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
          controller: ScrollController(
              initialScrollOffset:
                  homeController.pokemonGritViewIndex.value.toDouble()),
          itemCount: pokemonController.pokemonList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0, mainAxisSpacing: 0, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                homeController.pokemonGritViewIndex.value =
                    Scrollable.of(context).position.pixels.toInt();
                homeController.homeController.animateToPage(1,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
                homeController.pokemonPageViewIndex.value = index;
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        pokemonController.pokemonList[index].img,
                      ),
                      Text(
                        pokemonController.pokemonList[index].name.toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Pocket-Monk', fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
