import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //PageController homeController = PageController();
  PageController homeController = PageController();
  var pokemonPageViewIndex = 0.obs;
  var pokemonGritViewIndex = 0.obs;
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     //write or call your logic
  //     //code will run when widget rendering complete
  //     //PageController homeController = PageController();
  //   });

  //   super.onInit();
  // }
}
