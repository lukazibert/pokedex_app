import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/views/game_view.dart';
import 'package:pokedex_app/widgets/custom_row_grid.dart';

import 'game_view_text_input.dart';

class GameStart extends StatelessWidget {
  final GameControlller gameControlller = Get.put(GameControlller());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              //height: 100,
              alignment: Alignment.center,
              child: Stack(children: [
                Text(
                  'Who\'s that \n pokemon?',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Pocket-monk',
                    letterSpacing: 1.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.blue[700],
                  ),
                ),
                Text(
                  'Who\'s that \n pokemon?',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 60.0,
                    color: Colors.yellowAccent[700],
                    fontFamily: 'Pocket-monk',
                  ),
                ),
              ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(children: [
                          Text(
                            'Best score',
                            style: TextStyle(
                              fontFamily: 'Pocket-monk',
                              fontSize: 25.0,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
                            ),
                          ),
                          Text(
                            'Best score',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pocket-monk',
                                fontSize: 25.0),
                          ),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontFamily: 'Pocket-monk',
                                  fontSize: 40.0,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.black,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Pocket-monk',
                                    fontSize: 40.0),
                              ),
                            ]),
                            Text(
                              '/15',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pocket-monk',
                                  fontSize: 40.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 100.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(children: [
                          Text(
                            'Previus score',
                            style: TextStyle(
                              fontFamily: 'Pocket-monk',
                              fontSize: 25.0,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
                            ),
                          ),
                          Text(
                            'Previus score',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pocket-monk',
                                fontSize: 25.0),
                          ),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontFamily: 'Pocket-monk',
                                  fontSize: 40.0,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.black,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Pocket-monk',
                                    fontSize: 40.0),
                              ),
                            ]),
                            Text(
                              '/15',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Pocket-monk',
                                  fontSize: 40.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Text('Select the number of rounds you want to play'),
          // Obx(
          //   () => DropdownButton<String>(
          //     value: gameControlller.dropDownValue.value,
          //     onChanged: (String newValue) =>
          //         gameControlller.dropDownValue.value = newValue,
          //     items: <String>['5', '10', '50', '100', '150']
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         child: Text(value),
          //         value: value,
          //       );
          //     }).toList(),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Get.to(() => GameView());
              Future.delayed(Duration(seconds: 1));
              gameControlller.start();
            },
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                      offset: Offset(1.5, 4),
                    ),
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.videogame_asset_outlined,
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pocket-monk',
                          fontSize: 70.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
