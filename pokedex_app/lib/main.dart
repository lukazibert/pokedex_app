import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
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
    );
  }
}
