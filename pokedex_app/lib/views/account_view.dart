import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';

class AccountView extends StatelessWidget {
  var isLoggedIn = true;
  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? accountPage(context) : logInPage();
  }
}

Widget accountPage(BuildContext context) {
  PokemonController pokemonController = Get.put(PokemonController());
  AccountController accountController = Get.put(AccountController());
  var width = MediaQuery.of(context).size.width;
  return Container(
    color: Colors.red,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Container(
            height: width * 0.95,
            width: width * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                    offset: Offset(1.5, 4),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 25.0,
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          smallCircle(0),
                          SizedBox(
                            width: 10.0,
                          ),
                          smallCircle(1),
                          SizedBox(
                            width: 10.0,
                          ),
                          smallCircle(2),
                        ],
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  height: width * 0.8,
                  width: width * 0.9,
                  child: PageView(
                      onPageChanged: (value) {
                        accountController.seletedIndex.value = value;
                      },
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Name:',
                                  style: TextStyle(
                                      fontFamily: 'Pocket-Monk',
                                      fontSize: 40.0),
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    'Luka Žibert',
                                    style: TextStyle(fontSize: 50.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Favorite Pokemon:',
                                  style: TextStyle(
                                      fontFamily: 'Pocket-Monk',
                                      fontSize: 40.0),
                                ),
                              ),
                              Flexible(
                                  flex: 4,
                                  child: Center(
                                    child: Image.network(
                                        pokemonController.pokemonList[0].img),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  'Highest Score:',
                                  style: TextStyle(
                                      fontFamily: 'Pocket-Monk',
                                      fontSize: 40.0),
                                ),
                              ),
                              Flexible(
                                flex: 4,
                                child: Center(
                                  child: Text(
                                    '40%',
                                    style: TextStyle(
                                        fontSize: 100.0,
                                        color: Colors.greenAccent[400]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: 25.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.radio_button_unchecked_sharp,
                        color: Colors.red[900],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.edit),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.07,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.circle,
                size: width * 0.3,
                color: Colors.black87,
              ),
              Icon(
                Icons.gamepad_rounded,
                size: width * 0.3,
                color: Colors.black87,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget logInPage() {
  return Container();
}

Widget smallCircle(int index) {
  AccountController accountController = Get.find();
  return Container(
    width: 10.0,
    height: 10.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: index == accountController.seletedIndex.value
          ? Colors.red[900]
          : Colors.black,
    ),
  );
}
