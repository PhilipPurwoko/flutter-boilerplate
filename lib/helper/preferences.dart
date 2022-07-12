import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_boilerplate/common/const.dart';

class Prefs {
  final box = Hive.box(boxUser);

  static const String deviceModelKey = 'deviceModelKey';

  String? get deviceModel => box.get(deviceModelKey);
  set deviceModel(String? val) => box.put(deviceModelKey, val);

  Future<void> clear() async => await box.clear();
}
