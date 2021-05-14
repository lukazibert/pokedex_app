import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/home_page_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/widgets/pokemon_card.dart';

class PokemonPageView extends StatelessWidget {
  final PokemonController pokemonController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() => PageView.builder(
          controller: PageController(
              initialPage: homeController.pokemonPageViewIndex.value,
              viewportFraction: 0.9),
          scrollDirection: Axis.vertical,
          itemCount: pokemonController.pokemonList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: PokemonCard(pokemonController.pokemonList[index]),
            );
          })),
    );
  }
}
