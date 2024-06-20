import 'package:flutter/material.dart';

final inputDecorationLightStyle = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(),
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    floatingLabelStyle: TextStyle(color: Colors.black),
    helperStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.black),
    labelStyle: TextStyle(color: Colors.black));
final inputDecorationDarkStyle = InputDecorationTheme(
    border: OutlineInputBorder(),
    floatingLabelStyle:
        TextStyle(color: const Color.fromARGB(255, 243, 242, 242)),
    helperStyle: TextStyle(color: const Color.fromARGB(255, 243, 242, 242)),
    hintStyle: TextStyle(color: const Color.fromARGB(255, 243, 242, 242)),
    labelStyle: TextStyle(color: const Color.fromARGB(255, 243, 242, 242)));
