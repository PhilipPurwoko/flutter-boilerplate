import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_boilerplate/common/const.dart';
import 'package:flutter_boilerplate/common/theme.dart';
import 'package:flutter_boilerplate/helper/logger.dart';
import 'package:flutter_boilerplate/helper/preferences.dart';
import 'package:flutter_boilerplate/router/route.dart';
import 'package:flutter_boilerplate/widget/conditional_parrent_widget.dart';
import 'package:flutter_boilerplate/widget/custom_error_scaffold.dart';

Future<void> appInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Can be risky in production, consider better solution. See below
  // https://stackoverflow.com/questions/54285172/how-to-solve-flutter-certificate-verify-failed-error-while-performing-a-post-req
  ByteData data = await PlatformAssetBundle().load(
    'assets/certificates/lets-encrypt-r3.pem',
  );
  SecurityContext.defaultContext.setTrustedCertificatesBytes(
    data.buffer.asUint8List(),
  );

  await Hive.initFlutter();
  await Hive.openBox(boxUser);

  await FlutterLogs.initLogs(
    logLevelsEnabled: [
      LogLevel.INFO,
      LogLevel.WARNING,
      LogLevel.ERROR,
      LogLevel.SEVERE
    ],
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    directoryStructure: DirectoryStructure.FOR_DATE,
    logTypesEnabled: ['device', 'network', 'errors'],
    logFileExtension: LogFileExtension.LOG,
    logsWriteDirectoryName: 'FLUTTER APP',
    logsExportDirectoryName: 'FLUTTER APP/Logs',
    debugFileOperations: true,
    isDebuggable: true,
  );

  final deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  final String deviceModel = '${androidInfo.brand} ${androidInfo.model}';
  final prefs = Prefs();
  prefs.deviceModel = deviceModel;
  logInfo('Running on $deviceModel');
}

class App extends StatelessWidget {
  const App({Key? key, this.isDev = false}) : super(key: key);

  final bool isDev;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ConditionalParentWidget(
        condition: isDev,
        parent: (child) => FlavorBanner(child: child),
        child: GetMaterialApp(
          title: 'FLUTTER APP',
          theme: CustomTheme.myTheme(context),
          builder: EasyLoading.init(
            builder: (BuildContext context, Widget? widget) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomErrorScaffold(error: errorDetails);
              };
              return widget ?? Container();
            },
          ),
          initialRoute: RouteName.home,
          getPages: routeProfile,
        ),
      ),
    );
  }
}
