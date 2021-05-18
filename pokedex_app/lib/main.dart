import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/account_controller.dart';
import 'package:pokedex_app/controllers/pokemon_controller.dart';
import 'package:pokedex_app/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/loading_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());
  PokemonController pokemonController = Get.put(PokemonController());
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    accountController.initialLogIn();
    return Obx(() => pokemonController.isLoading.value
        ? LoadingAnimation()
        : GetMaterialApp(
            theme: ThemeData(
                primaryColor: Colors.red, accentColor: Colors.redAccent),
            debugShowCheckedModeBanner: false,
            home: WillPopScope(
              onWillPop: () async => false,
              child: FutureBuilder(
                // Initialize FlutterFire:
                future: _initialization,
                builder: (context, snapshot) {
                  // Check for errors
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return HomeView();
                  }

                  // Once complete, show your application
                  if (snapshot.connectionState == ConnectionState.done) {
                    print('sucsess');
                    return HomeView();
                  }

                  // Otherwise, show something whilst waiting for initialization to complete
                  print('loading');
                  return HomeView();
                },
              ),
            ),
          ));
  }
}
