import 'package:go_router/go_router.dart';
import 'package:test_bro/src/feature/home/widget/home_screen.dart';
import 'package:test_bro/src/feature/quize/widget/quiz_screen.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'quiz',
      path: '/quiz/:startPage/:pages/:resultPage',
      builder: (context, state) => QuizScreen(
        startPage: state.pathParameters['startPage']!,
        pages: state.pathParameters['pages']!.split(":"),
        resultPage: state.pathParameters['resultPage']!.split(":"),
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