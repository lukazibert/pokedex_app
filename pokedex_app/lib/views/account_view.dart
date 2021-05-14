import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/game_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/widgets/account/account_logged_in.dart';
import 'package:pokedex_app/widgets/account/login_form.dart';
import 'package:pokedex_app/widgets/account/register_form.dart';

class AccountView extends StatelessWidget {
  final PokemonController _pokemonController = Get.put(PokemonController());
  final AccountController _accountController = Get.put(AccountController());
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static String error = '';
  static String email = '';
  static String password = '';

  @override
  Widget build(BuildContext context) {
    _accountController.seletedIndex.value = 0;
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    return Container(
      //height: double.infinity,
      width: width,
      color: Colors.red,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Container(
              height: heigth * 0.75,
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
                    child: Obx(() => Opacity(
                          opacity:
                              _accountController.isLoggedIn.value ? 1.0 : 0.0,
                          child: Row(
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
                          ),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    height: heigth * 0.6,
                    width: width * 0.9,
                    child: Obx(
                      () => AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: _accountController.isLoggedIn.value
                            ? AccountLoggedIn()
                            : AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: _accountController.registerButton.value
                                    ? RegisterForm()
                                    : LoginForm(),
                              ),
                      ),
                    ),
                  ),
                  Container(
                    height: 25.0,
                    child: Obx(
                      () => Opacity(
                        opacity:
                            _accountController.isLoggedIn.value ? 1.0 : 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => _accountController.logOut(),
                              child: Row(
                                children: [
                                  Text(
                                    'Log out',
                                    style: TextStyle(
                                        fontFamily: 'Pocket-monk',
                                        fontSize: 20,
                                        letterSpacing: 1),
                                  ),
                                  Icon(
                                    Icons.logout,
                                    color: Colors.red[900],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _accountController.choseFav.value = true;
                              },
                              child: Icon(Icons.edit),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget smallCircle(int index) {
    //_accountController
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == _accountController.seletedIndex.value
            ? Colors.red[900]
            : Colors.black,
      ),
    );
  }
}
