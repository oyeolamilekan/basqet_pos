import 'package:flutter/material.dart';

import 'keypad.dart';

class KeyBoard extends StatelessWidget {
  final Function(String value) onCallback;
  final Function deleteLastNumber;

  const KeyBoard({
    Key? key,
    required this.onCallback,
    required this.deleteLastNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyPad(
              callbackAction: () => onCallback("1"),
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("2"),
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("3"),
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyPad(
              callbackAction: () => onCallback("4"),
              child: Text(
                "4",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("5"),
              child: Text(
                "5",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("6"),
              child: Text(
                "6",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyPad(
              callbackAction: () => onCallback("7"),
              child: Text(
                "7",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("8"),
              child: Text(
                "8",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("9"),
              child: Text(
                "9",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            KeyPad(
              callbackAction: () => onCallback("."),
              child: Icon(
                Icons.circle,
                size: MediaQuery.of(context).size.width * 0.02,
              ),
            ),
            KeyPad(
              callbackAction: () => onCallback("0"),
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
            KeyPad(
              callbackAction: () => deleteLastNumber(),
              child: Icon(
                Icons.arrow_back,
                size: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
