import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/drawer/end_drawer%20copy.dart';
import 'package:pokedex_app/widgets/navigation.dart';

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
      resizeToAvoidBottomInset: false,
    );
  }
}
