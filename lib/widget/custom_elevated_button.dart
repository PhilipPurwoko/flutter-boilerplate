import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/color.dart';
import 'package:flutter_boilerplate/common/space.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.shape,
    this.height,
    this.width,
  }) : super(key: key);

  CustomElevatedButton.rounded({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height,
    shape,
  })  : shape = shape ??
            MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: borderLarge,
              ),
            ),
        super(key: key);

  final void Function() onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ?? colorPrimary),
          shape: shape ??
              MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: borderSmall,
                ),
              ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
