import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({
    Key? key,
    required this.callbackAction,
    required this.child,
  }) : super(key: key);

  final Function callbackAction;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: InkWell(
            splashColor: Colors.grey,
            onTap: () => callbackAction(),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
