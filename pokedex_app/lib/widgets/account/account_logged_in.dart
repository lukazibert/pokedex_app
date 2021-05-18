import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/widgets/account/set_fav_img.dart';

class AccountLoggedIn extends StatelessWidget {
  final AccountController _accountController = Get.find();
  final PokemonController _pokemonController = Get.find();
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        _accountController.seletedIndex.value = value;
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
                  style: TextStyle(fontFamily: 'Pocket-Monk', fontSize: 40.0),
                ),
              ),
              Flexible(
                flex: 4,
                child: Center(
                  child: FutureBuilder<DocumentSnapshot>(
                      future: _accountController.getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data = snapshot.data.data();
                          return Text(
                            '${data['name']}'.toUpperCase(),
                            style: TextStyle(fontSize: 50),
                          );
                        }

                        return Text("loading");
                      }),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => _accountController.choseFav.value
              ? Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Chose your favorite Pokemon:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Pocket-Monk', fontSize: 30.0),
                        ),
                      ),
                      Flexible(
                          flex: 6,
                          child: ListView.builder(
                              itemCount: _pokemonController.pokemonList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  //selected:
                                  //index == _accountController.selectedIndex,
                                  selectedTileColor: Colors.red,
                                  onTap: () {
                                    _accountController.setFavPokemon(index);
                                  },
                                  leading: Image.network(_pokemonController
                                      .pokemonList[index].img),
                                  title: Text(
                                    _pokemonController.pokemonList[index].name,
                                    style: TextStyle(
                                        fontFamily: 'Pocket-Monk',
                                        fontSize: 20.0),
                                  ),
                                );
                              }))
                    ],
                  ),
                )
              //actual show fav pokemon
              : Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Favorite Pokemon:',
                          style: TextStyle(
                              fontFamily: 'Pocket-Monk', fontSize: 40.0),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: FutureBuilder<DocumentSnapshot>(
                            future: _accountController.getData(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                Map<String, dynamic> data =
                                    snapshot.data.data();
                                return Center(
                                  child: data['favPokemonIndex'] == ''
                                      ? SetFavImg()
                                      : Image.network(
                                          _pokemonController
                                              .pokemonList[int.parse(
                                                  data['favPokemonIndex'])]
                                              .img,
                                          scale: 0.6,
                                        ),
                                );
                              }

                              return Text("loading");
                            }),
                      )
                    ],
                  ),
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
                  style: TextStyle(fontFamily: 'Pocket-Monk', fontSize: 40.0),
                ),
              ),
              Flexible(
                flex: 4,
                child: Center(
                  child: FutureBuilder<DocumentSnapshot>(
                      future: _accountController.getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data = snapshot.data.data();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: [
                                Text(
                                  data['bestScore'],
                                  style: TextStyle(
                                    fontFamily: 'Pocket-monk',
                                    fontSize: 100.0,
                                    letterSpacing: 3,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Colors.black,
                                  ),
                                ),
                                Text(
                                  data['bestScore'],
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      color: Colors.yellow,
                                      fontFamily: 'Pocket-monk',
                                      fontSize: 100.0),
                                ),
                              ]),
                            ],
                          );
                        }

                        return Text("loading");
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
