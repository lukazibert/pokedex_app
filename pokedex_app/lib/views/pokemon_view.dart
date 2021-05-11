import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/home_page_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/widgets/grid_view.dart';
import 'package:pokedex_app/widgets/page_view.dart';

class PokemonView extends StatelessWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  final HomeController homeController = Get.put(HomeController());
  List<Widget> homeList = <Widget>[PokemonGridView(), PokemonPageView()];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (pokemonController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return PageView.builder(
            controller: homeController.homeController,
            itemCount: homeList.length,
            itemBuilder: (context, index) {
              return homeList[index];
            });
      }
    });
  }
}
