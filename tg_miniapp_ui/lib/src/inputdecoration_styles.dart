import 'package:flutter/material.dart';

const inputDecorationLightStyle = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    floatingLabelStyle: TextStyle(color: Colors.black),
    helperStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.black),
    labelStyle: TextStyle(color: Colors.black),);
final inputDecorationDarkStyle = InputDecorationTheme(
  hintFadeDuration: Durations.medium1,
  focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide:
          BorderSide(color: Color.fromARGB(26, 250, 250, 252), width: 2),),
  disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.white, width: 2),),
  enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Colors.white, width: 2),),
  floatingLabelStyle:
      const TextStyle(color: Color.fromARGB(255, 243, 242, 242)),
  helperStyle: const TextStyle(color: Color.fromARGB(255, 243, 242, 242)),
  hintStyle: WidgetStateTextStyle.resolveWith((states) {
    if (states.contains(WidgetState.focused)) {
      return const TextStyle(color: Color.fromARGB(26, 250, 250, 252));
    }
    return const TextStyle(color: Color.fromARGB(255, 243, 242, 242));
  }),
  labelStyle: WidgetStateTextStyle.resolveWith((states) {
    if (states.contains(WidgetState.focused)) {
      return const TextStyle(color: Color.fromARGB(26, 250, 250, 252));
    }
    return const TextStyle(color: Color.fromARGB(255, 243, 242, 242));
  }),
);
