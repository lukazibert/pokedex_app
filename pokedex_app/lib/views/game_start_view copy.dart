import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/navigation_controller.dart';
import 'package:pokedex_app/views/game_view.dart';
import 'package:pokedex_app/widgets/custom_row_grid.dart';

import 'game_view_text_input.dart';

class GameStart2 extends StatelessWidget {
  final GameControlller gameControlller = Get.put(GameControlller());
  final AccountController accountController = Get.put(AccountController());
  final NavigationController navigationController =
      Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
          Stack(children: [
            Text(
              'game',
              style: TextStyle(
                fontSize: 150.0,
                fontFamily: 'Pocket-monk',
                letterSpacing: 10.0,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 10
                  ..color = Colors.blue[700],
              ),
            ),
            Text(
              'game',
              style: TextStyle(
                letterSpacing: 10.0,
                fontSize: 150.0,
                color: Colors.yellowAccent[700],
                fontFamily: 'Pocket-monk',
              ),
            ),
          ]),
          Obx(
            () => Row(
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
                          accountController.isLoggedIn.value
                              ? StreamBuilder<QuerySnapshot>(
                                  stream: accountController.getStreamData(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    }
                                    return ListView(
                                      children: snapshot.data.docs.map(
                                        (DocumentSnapshot document) {
                                          return Stack(
                                            children: [
                                              Text(
                                                document['bestScore'],
                                                style: TextStyle(
                                                  fontFamily: 'Pocket-monk',
                                                  fontSize: 40.0,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 6
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              Text(
                                                document['bestScore'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Pocket-monk',
                                                    fontSize: 40.0),
                                              ),
                                            ],
                                          );
                                        },
                                      ).toList(),
                                    );
                                  },
                                )
                              // FutureBuilder<DocumentSnapshot>(
                              //     future: accountController.getData(),
                              //     builder: (BuildContext context,
                              //         AsyncSnapshot snapshot) {
                              //       if (snapshot.connectionState ==
                              //           ConnectionState.done) {
                              //         Map<String, dynamic> data =
                              //             snapshot.data.data();
                              //         return Row(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.center,
                              //           children: [

                              //           ],
                              //         );
                              //       }

                              //       return Text("loading");
                              //     })
                              : Container(
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      //focusColor: Colors.black,
                                      splashColor:
                                          Colors.white.withOpacity(0.2),
                                      onTap: () {
                                        navigationController.selectedWidget
                                            .value = WidgetMarker.account;
                                      },
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //     color: Colors.yellow,
                                        //     borderRadius:
                                        //         BorderRadius.all(Radius.circular(20.0))),
                                        height: 30.0,
                                        width: 100.0,
                                        child: Center(
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                fontFamily: 'Pocket-monk',
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                          accountController.isLoggedIn.value
                              ? StreamBuilder<QuerySnapshot>(
                                  stream: accountController
                                      .getStreamData()
                                      .snapshots(),
                                  // .listen(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    }
                                    return ListView(
                                      children: snapshot.data.docs.map(
                                        (DocumentSnapshot document) {
                                          return Stack(
                                            children: [
                                              Text(
                                                document['previusScore'],
                                                style: TextStyle(
                                                  fontFamily: 'Pocket-monk',
                                                  fontSize: 40.0,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 6
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              Text(
                                                document['previusScore'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Pocket-monk',
                                                    fontSize: 40.0),
                                              ),
                                            ],
                                          );
                                        },
                                      ).toList(),
                                    );
                                  },
                                )
                              : Container(
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
                                    color: Colors.blue,
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      //focusColor: Colors.black,
                                      splashColor:
                                          Colors.white.withOpacity(0.2),
                                      onTap: () {
                                        navigationController.selectedWidget
                                            .value = WidgetMarker.account;
                                      },
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //     color: Colors.yellow,
                                        //     borderRadius:
                                        //         BorderRadius.all(Radius.circular(20.0))),
                                        height: 30.0,
                                        width: 100.0,
                                        child: Center(
                                          child: Text(
                                            'Sign In',
                                            style: TextStyle(
                                                fontFamily: 'Pocket-monk',
                                                fontSize: 20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 1, offset: Offset(1.5, 3)),
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.red,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //focusColor: Colors.black,
                splashColor: Colors.white.withOpacity(0.2),
                onTap: () async {
                  //await Future.delayed(Duration(milliseconds: 100));
                  gameControlller.start();
                  gameControlller.pointsCount.value = 0;
                  gameControlller.roundsCount.value = 0;
                  await Future.delayed(Duration(milliseconds: 400));
                  Get.to(() => GameView());
                  //Get.off(GameStart());
                },
                child: Container(
                  height: 100,
                  width: 300,
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
            ),
          ),
        ],
      ),
    );
  }
}
