import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/common/color.dart';
import 'package:flutter_boilerplate/common/space.dart';
import 'package:flutter_boilerplate/common/theme.dart';
import 'package:flutter_boilerplate/router/route.dart';
import 'package:flutter_boilerplate/widget/custom_elevated_button.dart';

class CustomErrorScaffold extends StatelessWidget {
  const CustomErrorScaffold({
    Key? key,
    required this.error,
  }) : super(key: key);

  final FlutterErrorDetails error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: paddingRegular,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mohon maaf',
                textAlign: TextAlign.center,
                style: myTextTheme.headline6,
              ),
              Text(
                'Terjadi kesalahan pada aplikasi',
                textAlign: TextAlign.center,
                style: myTextTheme.headline6,
              ),
              verticalSpaceRegular,
              CustomElevatedButton(
                text: 'Kembali',
                width: 200,
                onPressed: () {
                  Get.offAllNamed(RouteName.home);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: kDebugMode,
        child: Padding(
          padding: paddingRegular,
          child: CustomElevatedButton(
            text: 'Lihat error',
            color: colorRed,
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Error Details'),
                  content: SizedBox(
                    height: Get.height / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(error.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
