import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_boilerplate/common/space.dart';

class CustomLottie extends StatelessWidget {
  const CustomLottie.empty({
    Key? key,
    asset,
    this.text,
    this.width,
    this.height,
  })  : asset = 'assets/lotties/empty.json',
        super(key: key);

  const CustomLottie.notFound({
    Key? key,
    asset,
    this.text,
    this.width,
    this.height,
  })  : asset = 'assets/lotties/not-found.json',
        super(key: key);

  const CustomLottie.loading({
    Key? key,
    asset,
    this.text,
    this.width,
    this.height,
  })  : asset = 'assets/lotties/loading.json',
        super(key: key);

  final String asset;
  final String? text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            asset,
            width: width,
            height: height,
            reverse: true,
          ),
          if (text?.isNotEmpty ?? false) ...[
            verticalSpaceSmall,
            Text(text!, textAlign: TextAlign.center),
          ]
        ],
      ),
    );
  }
}
