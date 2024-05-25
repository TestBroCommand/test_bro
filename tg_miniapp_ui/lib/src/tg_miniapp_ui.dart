import 'package:flutter/material.dart';
import 'package:tg_miniapp_ui/tg_miniapp_ui.dart';

/// {@template tg_miniapp_ui}
/// Flutter ui kit for tapps
/// {@endtemplate}
class TgMiniappUi {
  /// {@macro tg_miniapp_ui}
  TgMiniappUi();
  final ThemeData darkAndroid = ThemeData(
    cardTheme: darkAndroidCardTheme,
  );
  final ThemeData darlIos = ThemeData(
    cardTheme: darkIosCardTheme,
  );
  final ThemeData lightIos = ThemeData(
    cardTheme: lightIosCardTheme,
  );
  final ThemeData lightAndroid = ThemeData(
    cardTheme: lightAndroidCardTheme,
  );
}
