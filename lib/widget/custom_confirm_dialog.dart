import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boilerplate/common/space.dart';
import 'package:flutter_boilerplate/widget/custom_elevated_button.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    Key? key,
    required this.title,
    this.cancelText,
    this.continueText,
    this.additionalWidget,
  }) : super(key: key);

  final String title;
  final String? cancelText;
  final String? continueText;
  final Widget? additionalWidget;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      contentPadding: paddingSmall,
      children: [
        if (additionalWidget != null) additionalWidget!,
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: cancelText ?? 'Batal',
                color: Colors.red,
                onPressed: () {
                  Get.back(result: false);
                },
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: CustomElevatedButton(
                text: continueText ?? 'Lanjutkan',
                onPressed: () {
                  Get.back(result: true);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
