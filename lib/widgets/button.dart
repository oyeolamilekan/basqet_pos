import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../extension/num.dart';

class Button extends StatelessWidget {
  final Widget child;
  final double? width;
  final double height;
  final double radius;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback onPressed;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const Button({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height = 55.0,
    this.radius = 5,
    this.color,
    this.padding,
    this.margin,
    this.border,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width: width ?? 100.w,
      height: height,
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(radius),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
