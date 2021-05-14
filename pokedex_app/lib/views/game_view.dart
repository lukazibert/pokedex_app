import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

class GameView extends StatelessWidget {
  final PokemonController pokemonController = Get.put(PokemonController());
  final GameControlller gameControlller = Get.put(GameControlller());
  final AccountController accountController = Get.put(AccountController());
  final textControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //savipergameControlller.start();
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    //var keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
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
                        //pokemon img
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
                                        //key: ValueKey(1),
                                      ),
                                      colorFilter: ColorFilter.mode(
                                          Colors.blue[900], BlendMode.srcATop),
                                    )
                                  : Image.network(
                                      pokemonController
                                          .pokemonList[gameControlller
                                              .currentImgIndex.value]
                                          .img,
                                      scale: 0.6,
                                      //key: ValueKey(2),
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //?
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
                  //pokemon/ show pokemon name
                  Obx(
                    () => Positioned(
                      top: screenHeigth * 0.45,
                      right: screenHeigth * 0.02,
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 1000),
                        child: !gameControlller.showName.value
                            ? Stack(
                                children: [
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
                                ],
                              )
                            : Stack(
                                children: [
                                  Text(
                                    'It\'s ' +
                                        pokemonController
                                            .pokemonList[gameControlller
                                                .currentImgIndex.value]
                                            .name,
                                    style: TextStyle(
                                      fontSize: 50.0,
                                      fontFamily: 'Pocket-monk',
                                      letterSpacing: 1.0,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color = Colors.blue[700],
                                    ),
                                  ),
                                  Text(
                                    'It\'s ' +
                                        pokemonController
                                            .pokemonList[gameControlller
                                                .currentImgIndex.value]
                                            .name,
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 50.0,
                                      color: Colors.yellowAccent[700],
                                      fontFamily: 'Pocket-monk',
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeigth * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //input field
                  Obx(
                    () => Container(
                      width: screenWidth * 0.9,
                      child: TextFormField(
                        controller: textControler,
                        enableInteractiveSelection: false,
                        readOnly: gameControlller.showName.value ? true : false,
                        onFieldSubmitted: (value) {
                          gameControlller.inputPokemon.value = value;
                          gameControlller.isCorrect();
                          if (gameControlller.inputCorrect.value)
                            gameControlller.pointsCount.value++;
                        },
                        style: TextStyle(color: Colors.white),
                        //keyboardAppearance: Brightness.dark,
                        decoration: InputDecoration(
                          prefixIcon: gameControlller.inputCorrect.value
                              ? Icon(Icons.check,
                                  color: gameControlller.showName.value
                                      ? Colors.white
                                      : Colors.red)
                              : Icon(Icons.close,
                                  color: gameControlller.showName.value
                                      ? Colors.white
                                      : Colors.red),
                          prefixStyle: TextStyle(
                              backgroundColor: gameControlller.showName.value
                                  ? Colors.white
                                  : Colors.red),
                          hintText: "Who\'s that pokemon ?",
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: 'Pocket-monk'),
                          //fillColor: Colors.white,
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
                  Obx(
                    () => AnimatedSwitcher(
                      duration: Duration(milliseconds: 150),
                      child: !gameControlller.showName.value
                          //Answer button
                          ? Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 1,
                                      offset: Offset(1.5, 3),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  color: Colors.yellow,
                                  child: InkWell(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    //focusColor: Colors.black,
                                    splashColor: Colors.white.withOpacity(0.2),
                                    onTap: () async {
                                      if (gameControlller.allowAnswer.value) {
                                        gameControlller.isHidden.value = false;
                                        await Future.delayed(
                                            Duration(seconds: 2));
                                        gameControlller.showName.value = true;
                                      }
                                      //if()
                                      //print(gameControlller.inputCorrect);
                                      // print(pokemonController
                                      //     .pokemonList[gameControlller
                                      //         .currentImgIndex.value]
                                      //     .name
                                      //     .toLowerCase());
                                      // print(gameControlller.inputPokemon
                                      //     .toLowerCase());
                                      // print(gameControlller.inputCorrect);
                                    },
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //     color: Colors.yellow,
                                      //     borderRadius:
                                      //         BorderRadius.all(Radius.circular(20.0))),
                                      height: 50.0,
                                      width: 200.0,
                                      child: Center(
                                        child: Text(
                                          'ANSWER',
                                          style: TextStyle(
                                              fontFamily: 'Pocket-monk',
                                              fontSize: 40.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                //score
                                Container(
                                  margin: EdgeInsets.only(top: 40.0),
                                  height: 100.0,
                                  width: 170.0,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      )),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Stack(children: [
                                        Text(
                                          'score',
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
                                          'score',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Pocket-monk',
                                              fontSize: 25.0),
                                        ),
                                      ]),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(children: [
                                            Text(
                                              '${gameControlller.pointsCount.value}',
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
                                              '${gameControlller.pointsCount.value}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Pocket-monk',
                                                  fontSize: 40.0),
                                            ),
                                          ]),
                                          Text(
                                            '/${gameControlller.roundsCount.value}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Pocket-monk',
                                                fontSize: 45.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //exit button
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 1,
                                              offset: Offset(1.5, 3),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: Colors.yellow,
                                          child: InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            //focusColor: Colors.black,
                                            splashColor:
                                                Colors.white.withOpacity(0.2),
                                            onTap: () async {
                                              await accountController
                                                  .setNewScore(
                                                      gameControlller
                                                          .pointsCount.value,
                                                      gameControlller
                                                          .roundsCount.value);
                                              gameControlller.exit();
                                            },
                                            child: Container(
                                              // decoration: BoxDecoration(
                                              //     color: Colors.yellow,
                                              //     borderRadius:
                                              //         BorderRadius.all(Radius.circular(20.0))),
                                              height: 50.0,
                                              width: 150.0,
                                              child: Center(
                                                child: Text(
                                                  'Exit',
                                                  style: TextStyle(
                                                      fontFamily: 'Pocket-monk',
                                                      fontSize: 40.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //next button
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 1,
                                              offset: Offset(1.5, 3),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: Colors.yellow,
                                          child: InkWell(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            //focusColor: Colors.black,
                                            splashColor:
                                                Colors.white.withOpacity(0.2),
                                            onTap: () {
                                              textControler.clear();
                                              gameControlller.start();
                                              // gameControlller
                                              //     .roundsCount.value++;
                                            },
                                            child: Container(
                                              height: 50.0,
                                              width: 150.0,
                                              child: Center(
                                                child: Text(
                                                  'Next',
                                                  style: TextStyle(
                                                      fontFamily: 'Pocket-monk',
                                                      fontSize: 40.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
