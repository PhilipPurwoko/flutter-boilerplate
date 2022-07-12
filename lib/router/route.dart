import 'package:get/get.dart';
import 'package:flutter_boilerplate/module/home/home_screen.dart';

class RouteName {
  static const home = '/home';
}

final routeProfile = [
  GetPage(
    name: RouteName.home,
    page: () => const HomeScreen(),
  ),
];
