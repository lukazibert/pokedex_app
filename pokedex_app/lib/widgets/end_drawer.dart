import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_app/controllers/home_page_controller.dart';
import 'package:pokedex_app/controllers/navigation_controller.dart';

import 'drawer_item.dart';

class CustomEndDrawer extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child:
          // Container(
          //   width: MediaQuery.of(context).size.width * 0.8,
          //   child: ClipPath(
          //     clipper: PokedexClipper(),
          //     child:
          Drawer(
        elevation: 50,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 50.0, bottom: 0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Center(
                  child: Text('My PokeDex',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pocket-Monk',
                          fontSize: 40.0)),
                )),
            Column(
              children: [
                DrawerItem(
                  text: 'My account',
                  onPressed: () {
                    navigationController.selectedWidget.value =
                        WidgetMarker.account;
                    Navigator.pop(context);
                  },
                  icon: Icons.account_circle,
                ),
                DrawerItem(
                  text: 'All pokemon',
                  onPressed: () {
                    if (homeController.homeController.hasClients)
                      homeController.homeController.jumpToPage(0);
                    homeController.pokemonGritViewIndex.value = 0;
                    Navigator.pop(context);
                    navigationController.selectedWidget.value =
                        WidgetMarker.all;
                  },
                  icon: Icons.grid_on,
                ),
                DrawerItem(
                  text: 'Pokemon details',
                  onPressed: () {
                    //homeController.homeController;
                    if (homeController.homeController.hasClients)
                      homeController.homeController.jumpToPage(1);
                    homeController.pokemonPageViewIndex.value = 0;
                    Navigator.pop(context);
                    navigationController.selectedWidget.value =
                        WidgetMarker.info;
                  },
                  icon: Icons.info_outline,
                ),
                DrawerItem(
                  text: 'Who\'s that pokemon?',
                  onPressed: () {
                    navigationController.selectedWidget.value =
                        WidgetMarker.game;
                    Navigator.pop(context);
                  },
                  icon: Icons.videogame_asset,
                ),
              ],
            )
          ],
        ),
      ),
    );
    //   ),
    // );
  }
}

class PokedexClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width / 2.6, size.height * 0.07);
    path.lineTo(0, size.height * 0.07);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class EndDrawerPainter extends CustomPainter {
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  PokedexClipper pokedexClipper = PokedexClipper();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..color = Colors.black;

    var path = pokedexClipper.getClip(size);

    canvas.drawPath(path, paint);
  }
}
