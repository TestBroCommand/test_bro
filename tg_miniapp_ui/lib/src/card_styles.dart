import 'package:flutter/material.dart';

final CardTheme darkCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Color.fromRGBO(6, 28, 51, 1),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);

final CardTheme lightCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);
