import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_boilerplate/app.dart';

Future<void> main() async {
  await appInitialization();
  FlavorConfig(
    name: 'DEV',
    color: Colors.red.withOpacity(0.6),
    location: BannerLocation.topStart,
  );
  runApp(const App(isDev: true));
}
