import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
