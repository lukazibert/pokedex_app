import 'package:flutter/material.dart';

var colors = {
  'Fire': 0xFFFA8072,
  'Grass': 0xFFDEFDE0,
  'Electric': 0xFFFCF7DE,
  'Water': 0xFFDEF3FD,
  'Ground': 0xFFf4e7da,
  'Rock': 0xFFd5d5d4,
  'Fairy': 0xFFfceaff,
  'Poison': 0xFF98d7a5,
  'Bug': 0xFFf8d5a3,
  'Dragon': 0xFF97b3e6,
  'Psychic': 0xFFeaeda1,
  'Flying': 0xFFF5F5F5,
  'Fighting': 0xFFE6E0D4,
  'Normal': 0xFFF5F5F5,
  'Ice': 0xFF86d6d8,
  'Ghost': 0xFFc3cad3,
  'Dark': 0xFFd754ff,
  'Steel': 0xFF43464B
};

class RowGrid extends StatelessWidget {
  final List<String> atributes;
  const RowGrid(this.atributes);

  @override
  Widget build(BuildContext context) {
    return atributes.length < 5
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: atributes
                .map((e) => Chip(
                      label: Text(e),
                      backgroundColor: Color(colors[e]),
                    ))
                .toList(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: atributes
                  .map((e) => Chip(
                        label: Text(e),
                        backgroundColor: Color(colors[e]),
                      ))
                  .toList(),
            ),
          );
  }
}
