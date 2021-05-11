import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController homeController = PageController();
  var pokemonPageViewIndex = 0.obs;
  var pokemonGritViewIndex = 0.obs;
}
