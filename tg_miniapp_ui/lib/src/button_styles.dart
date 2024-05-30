import 'package:flutter/material.dart';

ElevatedButtonTheme mainButtonTheme(Widget child) {
  return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(0, 122, 255, 1)),
        textStyle: WidgetStatePropertyAll(TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )),
      )),
      child: child);
}
