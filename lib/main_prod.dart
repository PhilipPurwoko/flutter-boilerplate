import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app.dart';

Future<void> main() async {
  await appInitialization();
  runApp(const App(isDev: true));
}
