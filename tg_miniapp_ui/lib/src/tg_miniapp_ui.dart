import 'package:flutter/material.dart';

final ThemeData _darkTheme = ThemeData.dark();
final ThemeData _lightTheme = ThemeData.light();

/// {@template tg_miniapp_ui}
/// Flutter ui kit for tapps
/// {@endtemplate}
final ThemeData darkAndroid = _darkTheme.copyWith(
  cardTheme: _darkTheme.cardTheme.copyWith(),
  checkboxTheme: _darkTheme.checkboxTheme.copyWith(),
  progressIndicatorTheme: _darkTheme.progressIndicatorTheme.copyWith(),
  buttonTheme: _darkTheme.buttonTheme.copyWith(),
);
final ThemeData darkIos = _darkTheme.copyWith(
  cardTheme: _darkTheme.cardTheme.copyWith(),
  checkboxTheme: _darkTheme.checkboxTheme.copyWith(),
  progressIndicatorTheme: _darkTheme.progressIndicatorTheme.copyWith(),
  buttonTheme: _darkTheme.buttonTheme.copyWith(),
);
final ThemeData lightIos = _lightTheme.copyWith(
  cardTheme: _lightTheme.cardTheme.copyWith(),
  checkboxTheme: _lightTheme.checkboxTheme.copyWith(),
  progressIndicatorTheme: _lightTheme.progressIndicatorTheme.copyWith(),
  buttonTheme: _lightTheme.buttonTheme.copyWith(),
);
final ThemeData lightAndroid = _lightTheme.copyWith(
  cardTheme: _lightTheme.cardTheme.copyWith(),
  checkboxTheme: _lightTheme.checkboxTheme.copyWith(),
  progressIndicatorTheme: _lightTheme.progressIndicatorTheme.copyWith(),
  buttonTheme: _lightTheme.buttonTheme.copyWith(),
);

class TgMiniappUi {
  /// {@macro tg_miniapp_ui}
  TgMiniappUi();
}
