import 'package:flutter/material.dart';
import 'package:tg_miniapp_ui/src/colors.dart';

final elevatedStyleDark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  maximumSize: Size(300, 100),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide.none,
  ),
  backgroundColor: Color(0xFF111820),
  foregroundColor: Colors.white,
));

final elevatedStyleLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
  maximumSize: Size(300, 100),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide.none,
  ),
  foregroundColor: primaryColor,
  backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
));
