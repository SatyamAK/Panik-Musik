import 'package:flutter/material.dart';
import 'package:panik_musik/constants/values.dart';

ElevatedButton button(
  Color color, IconData icon, void Function() onPressed, BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color
    ),
    onPressed: onPressed,
    child: Container(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Icon(
          icon,
          size: Values.buttonIconSize,
        ),
      ),
    )
  );
}
