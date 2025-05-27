import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Telas principais
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/account_screen.dart';
import '../presentation/screens/history_screen.dart';
import '../presentation/screens/preferences_screen.dart';

// Páginas de entidades
import '../presentation/screens/restaurante_page.dart';
import '../presentation/screens/culinaria_page.dart';
import '../presentation/screens/avaliacao_page.dart';
import '../presentation/screens/usuario_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      pageBuilder: (context, state) =>
          SlidePageTransition(child: LoginScreen()),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => SlidePageTransition(child: HomeScreen()),
      routes: [
        GoRoute(
          path: 'account',
          name: 'account',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: AccountScreen()),
        ),
        GoRoute(
          path: 'history',
          name: 'history',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: HistoryScreen()),
        ),
        GoRoute(
          path: 'preferences',
          name: 'preferences',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: PreferencesScreen()),
        ),
        GoRoute(
          path: 'restaurantes',
          name: 'restaurantes',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: RestaurantePage()),
        ),
        GoRoute(
          path: 'culinarias',
          name: 'culinarias',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: CulinariaPage()),
        ),
        GoRoute(
          path: 'avaliacoes',
          name: 'avaliacoes',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: AvaliacaoPage()),
        ),
        GoRoute(
          path: 'usuarios',
          name: 'usuarios',
          pageBuilder: (context, state) =>
              SlidePageTransition(child: UsuarioPage()),
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
