import 'package:flutter/material.dart';

class Ternary extends StatelessWidget {
  final bool condition;
  final Widget trueWidget;
  final Widget falseWidget;

  const Ternary({
    Key? key,
    required this.condition,
    required this.trueWidget,
    required this.falseWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return trueWidget;
    } else {
      return falseWidget;
    }
  }
}
