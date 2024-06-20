import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_miniapp_ui/src/colorshemes.dart';
import 'package:tg_miniapp_ui/src/inputdecoration_styles.dart';
import 'package:tg_miniapp_ui/tg_miniapp_ui.dart';

final ThemeData _darkTheme = ThemeData.dark();
final ThemeData _lightTheme = ThemeData.light();

/// {@template tg_miniapp_ui}
/// Flutter ui kit for tapps
/// {@endtemplate}
final ThemeData lightTheme = _lightTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: whiteColorScheme,
    textTheme: GoogleFonts.latoTextTheme(_lightTheme.textTheme),
    cardTheme: lightCardTheme,
    inputDecorationTheme: inputDecorationLightStyle);
final ThemeData darkTheme = _darkTheme.copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromRGBO(24, 34, 45, 1),
  colorScheme: darkColorScheme,
  textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
  cardTheme: darkCardTheme,
  inputDecorationTheme: inputDecorationDarkStyle,
);

class TgMiniappUi {
  /// {@macro tg_miniapp_ui}
  TgMiniappUi();
}
