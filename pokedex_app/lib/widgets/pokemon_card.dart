import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/widgets/custom_row_grid.dart';

import 'next_evolution_row.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin:
            EdgeInsets.only(bottom: 10.0, top: 10.0, left: 10.0, right: 10.0),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  pokemon.img,
                ),
                Text(
                  '${pokemon.name}'.toUpperCase(),
                  style: TextStyle(fontFamily: 'Pocket-Monk', fontSize: 30.0),
                ),
                Text(
                  'TYPE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RowGrid(pokemon.type),
                Text(
                  'WEAKNESSES',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RowGrid(pokemon.weaknesses),
                Text(
                  'NEXT EVOLUTION',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                NextEvolutionRow(pokemon),
              ]),
        ));
  }
}
