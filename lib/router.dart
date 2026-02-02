import 'package:go_router/go_router.dart';
import 'package:submeowsions/screens/main_screen.dart';
import 'package:submeowsions/screens/stats/db_debug_screen.dart';
import 'package:submeowsions/screens/list/list_screen_main.dart';
import 'package:submeowsions/screens/search/search_screen_main.dart';
import 'package:submeowsions/screens/stats/stats_screen_main.dart';
import 'package:submeowsions/views/publisher_view.dart';
import 'package:submeowsions/views/work_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/search',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScreen(child: child),

      routes: [
        GoRoute(
          path: '/search',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const SearchScreenMain()),
        ),
        GoRoute(
          path: '/works/:workId',
          builder: (context, state) =>
              WorkView(workId: state.pathParameters['workId']!),
        ),
        GoRoute(
          path: '/publishers/:publisherId',
          builder: (context, state) =>
              PublisherView(publisherId: state.pathParameters['publisherId']!),
        ),
        GoRoute(
          path: '/list',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const ListScreenMain()),
        ),
        GoRoute(
          path: '/stats',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: const StatsScreenMain()),
        ),
      ],
    ),
  ],
);
