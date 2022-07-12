import 'package:flutter/material.dart';

class ConditionalParentWidget extends StatelessWidget {
  const ConditionalParentWidget({
    Key? key,
    required this.condition,
    required this.parent,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final bool condition;
  final Widget Function(Widget child) parent;

  @override
  Widget build(BuildContext context) {
    return condition ? parent(child) : child;
  }
}
