import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Importação das telas
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/account_screen.dart';
import '../screens/history_screen.dart';
import '../screens/preferences_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      pageBuilder: (context, state) => SlidePageTransition(child: LoginScreen()),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => SlidePageTransition(child: HomeScreen()),
      routes: [
        GoRoute(
          path: 'account',
          name: 'account',
          pageBuilder: (context, state) => SlidePageTransition(child: AccountScreen()),
        ),
        GoRoute(
          path: 'history',
          name: 'history',
          pageBuilder: (context, state) => SlidePageTransition(child: HistoryScreen()),
        ),
        GoRoute(
          path: 'preferences',
          name: 'preferences',
          pageBuilder: (context, state) => SlidePageTransition(child: PreferencesScreen()),
        ),
      ],
    ),
  ],
);

/// Transição personalizada — deslizar da direita
class SlidePageTransition extends CustomTransitionPage {
  SlidePageTransition({required Widget child})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: child,
            );
          },
        );
}
