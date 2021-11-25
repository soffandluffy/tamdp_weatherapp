import 'package:flutter/material.dart';

Widget weatherInfoColumn({
  required String hour,
  required IconData icon,
  required String temperature,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Text(
        hour,
        style: const TextStyle(color: Colors.white),
      ),
      Icon(
        icon,
        color: Colors.white,
      ),
      Text(
        temperature,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
