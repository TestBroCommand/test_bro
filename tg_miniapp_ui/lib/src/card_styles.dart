import 'package:flutter/material.dart';

final CardTheme darkCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: const Color(0xFF182533),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);

final CardTheme lightCardTheme = CardTheme(
  clipBehavior: Clip.hardEdge,
  color: const Color(0xFF908F9E),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);
