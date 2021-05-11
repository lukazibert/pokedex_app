import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

class GameView extends StatelessWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  final GameControlller gameControlller = Get.put(GameControlller());

  @override
  Widget build(BuildContext context) {
    //gameControlller.start();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //resizeToAvoidBottomPadding: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
          child: Column(
            children: [
              Container(
                height: screenHeigth * 0.6,
                child: Stack(
                  children: [
                    Positioned(
                      top: screenHeigth * -0.02,
                      left: screenWidth * -0.2,
                      height: screenHeigth * 0.6,
                      width: screenHeigth * 0.6,
                      child: Stack(
                        children: [
                          Image.asset('assets/Untitled-1.png'),
                          Obx(
                            () => Align(
                              alignment: Alignment.center,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: gameControlller.isHidden.value
                                    ? ColorFiltered(
                                        child: Image.network(
                                          pokemonController
                                              .pokemonList[gameControlller
                                                  .currentImgIndex.value]
                                              .img,
                                          scale: 0.6,
                                          key: ValueKey(1),
                                        ),
                                        colorFilter: ColorFilter.mode(
                                            Colors.blue[900],
                                            BlendMode.srcATop),
                                      )
                                    : Image.network(
                                        pokemonController
                                            .pokemonList[gameControlller
                                                .currentImgIndex.value]
                                            .img,
                                        scale: 0.6,
                                        key: ValueKey(2),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: screenHeigth * 0.2,
                      right: screenHeigth * 0.02,
                      child: Stack(children: [
                        Text(
                          '?',
                          style: TextStyle(
                            fontSize: 200.0,
                            fontFamily: 'Pocket-monk',
                            letterSpacing: 1.0,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.blue[700],
                          ),
                        ),
                        Text(
                          '?',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 200.0,
                            color: Colors.yellowAccent[700],
                            fontFamily: 'Pocket-monk',
                          ),
                        ),
                      ]),
                    ),
                    Positioned(
                      top: screenHeigth * 0.45,
                      right: screenHeigth * 0.02,
                      child: Stack(children: [
                        Text(
                          'pokemon',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontFamily: 'Pocket-monk',
                            letterSpacing: 1.0,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.blue[700],
                          ),
                        ),
                        Text(
                          'pokemon',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 80.0,
                            color: Colors.yellowAccent[700],
                            fontFamily: 'Pocket-monk',
                          ),
                        ),
                      ]),
                    ),
                    // Positioned(
                    //   top: MediaQuery.of(context).padding.top + 5,
                    //   right: 10,
                    //   child: TextButton(
                    //     style: ButtonStyle(
                    //         foregroundColor: MaterialStateProperty.all(Colors.black)),
                    //     onPressed: () {},
                    //     child: Row(
                    //       children: [
                    //         Icon(Icons.exit_to_app),
                    //         Text('Exit And Save'.capitalize)
                    //       ],
                    //     ),
                    //   ),
                    // )
                    // Positioned(
                    //   bottom: keyBoardHeight == 0 ? 200 : keyBoardHeight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //       left: 10,
                    //       right: 10,
                    //     ),
                    //     child: Container(
                    //       width: screenWidth * 0.9,
                    //       child: TextFormField(
                    //         keyboardAppearance: Brightness.dark,
                    //         decoration: InputDecoration(
                    //           labelText: "Who\'s that pokemon",
                    //           labelStyle: TextStyle(color: Colors.white),
                    //           fillColor: Colors.white,
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide:
                    //                 const BorderSide(color: Colors.white, width: 2.0),
                    //             borderRadius: BorderRadius.circular(25.0),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide:
                    //                 const BorderSide(color: Colors.white, width: 2.0),
                    //             borderRadius: BorderRadius.circular(25.0),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              Obx(
                () => Container(
                    height: screenHeigth * 0.4,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Opacity(
                          opacity: gameControlller.nameOpacity.value,
                          child: Text(
                            'It\'s ${pokemonController.pokemonList[gameControlller.currentImgIndex.value].name}',
                            style: TextStyle(
                                fontFamily: 'Pocket-monk',
                                fontSize: 30.0,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        top: gameControlller.nameOpacity.value == 1.0 ? 40 : 0,
                        left: MediaQuery.of(context).size.width * 0.05,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: screenWidth * 0.9,
                            child: TextFormField(
                              keyboardAppearance: Brightness.dark,
                              decoration: InputDecoration(
                                labelText: "Who\'s that pokemon ?",
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Pocket-monk'),
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])),
              ),
            ],
          ),
        ));
  }
}
