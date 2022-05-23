import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/home/home_page.dart';
import '../../feature/introduction/intro_page.dart';
import '../../feature/settings/settings_page.dart';
import '../service/shared_preferences_provider.dart';
import 'route_paths.dart';
import 'router_helper_functions.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);

  return GoRouter(
    initialLocation: sharedPreferences.getBool('intro_viewed') ?? false ? routeToHome : routeToIntro,
    routes: <GoRoute>[
      GoRoute(
        path: routeToHome,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const HomePage()),
      ),
      GoRoute(
        path: routeToIntro,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const IntroPage()),
      ),
      GoRoute(
        path: routeToSettings,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const SettingsPage()),
      ),
    ],
  );
});
