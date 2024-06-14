import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:test_bro/src/feature/home/widget/home_screen.dart';
import 'package:test_bro/src/feature/quize/widget/quiz_screen.dart';

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    print(TelegramWebApp.instance.initDataUnsafe!.query_id);
    print(TelegramWebApp.instance.initDataUnsafe!.start_param);
    if (TelegramWebApp.instance.initDataUnsafe?.start_param != null) {
      return "/quiz/${TelegramWebApp.instance.initDataUnsafe!.start_param}";
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
