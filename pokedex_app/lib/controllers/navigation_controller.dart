import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

enum WidgetMarker { account, all, info, game }

class NavigationController extends GetxController {
  var selectedWidget = WidgetMarker.all.obs;
}
