import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/introduction/intro_page.dart';
import '../../feature/settings/settings_page.dart';
import '../service/shared_preferences_provider.dart';
import 'route_paths.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  final isIntroViewed = sharedPreferences.getBool('intro_viewed') ?? false;

  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (_) => isIntroViewed
            ? routeToSettings
            : routeToIntro,
      ),
      GoRoute(
        path: routeToIntro,
        builder: (BuildContext context, GoRouterState state) => const IntroPage(),
      ),
      GoRoute(
        path: routeToSettings,
        builder: (BuildContext context, GoRouterState state) => const SettingsPage(),
      ),
    ],
  );
});