import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/navigation_controller.dart';
import 'package:pokedex_app/views/account_view.dart';
import 'package:pokedex_app/views/game_start_view.dart';
import 'package:pokedex_app/views/game_view.dart';
import 'package:pokedex_app/views/game_view_text_input.dart';
import 'package:pokedex_app/views/pokemon_view.dart';

class Navigation extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => getSelectedView());
  }

  Widget getSelectedView() {
    switch (navigationController.selectedWidget.value) {
      case WidgetMarker.account:
        return AccountView();
      case WidgetMarker.all:
        return PokemonView();
      case WidgetMarker.info:
        return PokemonView();
      case WidgetMarker.game:
        return GameStart();
        break;
      // default:
      //   return PokemonView();
    }
  }
}
