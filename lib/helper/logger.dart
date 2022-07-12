import 'package:flutter_logs/flutter_logs.dart';
import 'package:flutter_boilerplate/helper/preferences.dart';

final _prefs = Prefs();

void logInfo(dynamic message) {
  FlutterLogs.logInfo(
    _prefs.deviceModel ?? 'Unknown Device',
    'FLUTTER APP',
    message.toString(),
  );
}

void logWarn(dynamic message) {
  FlutterLogs.logWarn(
    _prefs.deviceModel ?? 'Unknown Device',
    'FLUTTER APP',
    message.toString(),
  );
}

void logError(dynamic message) {
  FlutterLogs.logError(
    _prefs.deviceModel ?? 'Unknown Device',
    'FLUTTER APP',
    message.toString(),
  );
}
