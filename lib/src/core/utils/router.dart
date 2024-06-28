import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:test_bro/src/feature/home/widget/home_screen.dart';
import 'package:test_bro/src/feature/quize/widget/quiz_screen.dart';

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    final initData = TelegramWebApp.instance.initDataUnsafe;
    if (initData?.start_param != null) {
      final path = "/quiz/${initData!.start_param}";
      return path;
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
    // GoRoute(
    //   name: 'finalPage',
    //   path: '/quiz/:quizId',
    //   pageBuilder: (context, state) {
    //     final finalEntity = state.extra! as FinalEntity;
    //     final quizId = state.pathParameters['quizId']!;
    //     return CustomTransitionPage(
    //       key: state.pageKey,
    //       child: FinalPageQuiz(
    //         image: finalEntity.image,
    //         finalId: finalEntity.id,
    //         name: finalEntity.name,
    //         description: finalEntity.description,
    //         mostFrequentDigit: finalEntity.mostFrequentDigit,
    //         quizId: quizId,
    //       ),
    //       transitionDuration: const Duration(seconds: 1),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //           FadeTransition(
    //         opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    //         child: child,
    //       ),
    //     );
    //   },
    // ),

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
