import 'package:flutter/material.dart';

final inputDecorationLightStyle = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    floatingLabelStyle: TextStyle(color: Colors.black),
    helperStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.black),
    labelStyle: TextStyle(color: Colors.black));
final inputDecorationDarkStyle = InputDecorationTheme(
  hintFadeDuration: Durations.medium1,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide:
          BorderSide(color: const Color.fromARGB(26, 250, 250, 252), width: 2)),
  disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.white, width: 2)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.white, width: 2)),
  floatingLabelStyle:
      TextStyle(color: const Color.fromARGB(255, 243, 242, 242)),
  helperStyle: TextStyle(color: const Color.fromARGB(255, 243, 242, 242)),
  hintStyle: WidgetStateTextStyle.resolveWith((states) {
    if (states.contains(WidgetState.focused)) {
      return TextStyle(color: Color.fromARGB(26, 250, 250, 252));
    }
    return TextStyle(color: Color.fromARGB(255, 243, 242, 242));
  }),
  labelStyle: WidgetStateTextStyle.resolveWith((states) {
    if (states.contains(WidgetState.focused)) {
      return TextStyle(color: Color.fromARGB(26, 250, 250, 252));
    }
    return TextStyle(color: Color.fromARGB(255, 243, 242, 242));
  }),
);
