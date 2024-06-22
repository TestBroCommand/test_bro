import 'package:flutter/material.dart';

final CardTheme darkCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Color(0xFF182533),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);

final CardTheme lightCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: Color(0xFF908F9E),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);
