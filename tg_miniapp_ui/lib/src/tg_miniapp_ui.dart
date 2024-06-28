import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tg_miniapp_ui/src/colorshemes.dart';
import 'package:tg_miniapp_ui/src/elevated_button_styles.dart';
import 'package:tg_miniapp_ui/src/inputdecoration_styles.dart';
import 'package:tg_miniapp_ui/tg_miniapp_ui.dart';

final ThemeData _darkTheme = ThemeData.dark();
final ThemeData _lightTheme = ThemeData.light();

/// {@template tg_miniapp_ui}
/// Flutter ui kit for tapps
/// {@endtemplate}
final ThemeData lightTheme = _lightTheme.copyWith(
  elevatedButtonTheme: elevatedStyleLight,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromRGBO(247, 247, 247, 1),
  colorScheme: whiteColorScheme,
  textTheme: GoogleFonts.latoTextTheme(_lightTheme.textTheme),
  cardTheme: lightCardTheme,
  inputDecorationTheme: inputDecorationLightStyle,
  chipTheme: ChipThemeData(
    backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
  ),
);
final ThemeData darkTheme = _darkTheme.copyWith(
  elevatedButtonTheme: elevatedStyleDark,
  chipTheme: ChipThemeData(
    backgroundColor: const Color(0xFF17212B),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF17212B),
  colorScheme: darkColorScheme,
  textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
  cardTheme: darkCardTheme,
  inputDecorationTheme: inputDecorationDarkStyle,
);

class TgMiniappUi {
  /// {@macro tg_miniapp_ui}
  TgMiniappUi();
}
