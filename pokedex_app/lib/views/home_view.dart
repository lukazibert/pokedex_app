import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/home_page_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/widgets/end_drawer%20copy.dart';
import 'package:pokedex_app/widgets/end_drawer.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_app/widgets/grid_view.dart';
import 'package:pokedex_app/widgets/navigation.dart';
import 'package:pokedex_app/widgets/page_view.dart';
import 'package:pokedex_app/widgets/pokemon_card.dart';

import '../widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: CustomAppBar(context, _drawerKey),
      endDrawer: CustomEndDrawer2(),
      body: Navigation(),
    );
  }
}
