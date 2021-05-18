import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'dart:math' as math;

class LoadingAnimation extends StatelessWidget {
  PokemonController pokemonController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * math.pi),
          duration: Duration(milliseconds: 3500),
          curve: Curves.elasticInOut,
          builder: (context, value, child) => Transform.rotate(
            angle: value,
            child: child,
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset(
              'assets/pokeball.png',
              //scale: 0.5,
            ),
          ),
        ),
      ),
    );
    //   ),
    // ),
  }
}
