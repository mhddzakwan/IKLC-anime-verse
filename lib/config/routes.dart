import 'package:anime_verse/screens/favorite_screen.dart';
import 'package:anime_verse/screens/home_screen.dart';
import 'package:anime_verse/screens/profile_screen.dart';
import 'package:anime_verse/screens/signin_screen.dart';
import 'package:anime_verse/screens/signup_screen.dart';
import 'package:anime_verse/widgets/bottom_navigation_shell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/detail_screen.dart';

class AppRoutes {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String details = '/details';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(){
  // routes.dart
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.signIn,
    routes: [
      // 1. Auth Routes
      GoRoute(
        path: AppRoutes.signIn,
        name: 'sign-in',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: 'sign-up',
        builder: (context, state) => const SignUpScreen(),
      ),

      // 2. Detail Route
      GoRoute(
        path: '${AppRoutes.details}/:id',
        name: 'detail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final animeId = state.pathParameters['id'] ?? '';
          return DetailScreen(animeId: animeId);
        },
      ),

      // 3. ShellRoute (Untuk Halaman yang menggunakan Bottom Navigation Bar)
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return BottomNavigationShell(navigationShell: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favorites,
                name: 'favorite',
                builder: (context, state) => const FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}