import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test1/pages/pages.dart';

import 'package:test1/repositories/auth_repo.dart';
import 'package:test1/utils/is_first_run.dart';
 final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');
// GoRouter configuration
final router = GoRouter(
    debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,

  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) =>  const LoginPage(),
      redirect: (context, state) {
   final user = AuthenticationRepository().user;
      if (user != null) {
        return '/';
      } else {
        return null;
      }
  },
    ),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpPage(), redirect: (context, state) {
      final user = AuthenticationRepository().user;
      if (user != null) {
        return '/';
      } else {
        return null;
      }
      }),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
 builder: (BuildContext context, GoRouterState state, Widget child) {
          return Home(child: child);
        },      routes: [
        GoRoute(path: '/', builder: (context, state) => const ScanView()),
        GoRoute(path: '/update', builder: (context, state) => const UpdateView()),
        GoRoute(path: '/history', builder: (context, state) => const HistoryView()),
        GoRoute(path: '/generate-key', builder: (context, state) => const GenerateKeyView())
      ],
redirect: (context, state) {
   final user = AuthenticationRepository().user;
      if (user == null) {
        return '/login';
      } else {
   final isFirst = isFirstRun();
      if (isFirst) {
      return '/introduction';
      }
        return null;
      }
  },
    ),
    GoRoute(
      path: '/introduction',
      builder: (context, state) => const IntroductionView()
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) => const ResultView()
    ),
  ],
);