import 'package:flutter/material.dart';
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
    colorScheme: darkColorScheme,
    cardTheme: lightCardTheme,
    inputDecorationTheme: inputDecorationLightStyle);
final ThemeData darkTheme = _darkTheme.copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: darkColorScheme,
  cardTheme: darkCardTheme,
  inputDecorationTheme: inputDecorationDarkStyle,
);

class TgMiniappUi {
  /// {@macro tg_miniapp_ui}
  TgMiniappUi();
}
