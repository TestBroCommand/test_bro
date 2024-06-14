import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/home/widget/home_screen.dart';
import 'package:test_bro/src/feature/quize/widget/quiz_screen.dart';

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    try {
      Exception(TelegramWebApp.instance.initDataUnsafe!.start_param);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    if (TelegramWebApp.instance.initDataUnsafe?.start_param != null) {
      if (TelegramWebApp.instance.initDataUnsafe!.start_param == "quiz") {
        return null;
      }
    }
    if (state.matchedLocation.contains("/quiz")) {
      return null;
    }
    return '/';
  },
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'quiz',
      path: '/quiz/:id',
      builder: (context, state) => QuizScreen(
        id: state.pathParameters['id']!,
      ),
    ),
    // BottomNavigationBar
    /*  StatefulShellRoute.indexedStack(
      //  builder: (context, state, navigationShell) =>
      //     AppNavigation(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
           
          ],
        ),
        StatefulShellBranch(
          routes: [
            
          ],
        ),
      ],
    ),*/
  ],
);
