import 'package:flutter/material.dart';
import 'package:test_bro/src/core/constant/localization/localization.dart';
import 'package:test_bro/src/core/utils/router.dart';
import 'package:test_bro/src/feature/settings/widget/settings_scope.dart';
import 'package:tg_miniapp_ui/src/tg_miniapp_ui.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = SettingsScope.themeOf(context).theme;
    final locale = SettingsScope.localeOf(context).locale;

    return MaterialApp.router(
      theme: lightTheme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black, //<-- SEE HERE
              displayColor: Colors.black, //<-- SEE HERE
            ),
      ),
      darkTheme: darkTheme,
      themeMode: theme.mode,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      locale: locale,
      routerConfig: router,
      // TODO: You may want to override the default text scaling behavior.
      /*  builder: (context, child) => MediaQuery.withClampedTextScaling(
        key: _globalKey,
        minScaleFactor: 1.0,
        maxScaleFactor: 2.0,
        child: child!,
      ),
*/
    );
  }
}
