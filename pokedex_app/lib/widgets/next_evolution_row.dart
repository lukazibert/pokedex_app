import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';

class NextEvolutionRow extends StatelessWidget {
  final Pokemon pokemon;
  const NextEvolutionRow(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return pokemon.nextEvolution == null
        ? Chip(label: Text('Last evolution form'))
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: pokemon.nextEvolution
                .map((e) => Chip(label: Text(e.name)))
                .toList());
  }
}
