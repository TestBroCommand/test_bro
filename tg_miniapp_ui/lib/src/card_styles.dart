import 'package:flutter/material.dart';

final CardTheme darkCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
);

final CardTheme lightCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
  ),
);
