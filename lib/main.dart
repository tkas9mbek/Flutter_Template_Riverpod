import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '00_value/route_paths.dart';
import '02_service/provider/locale_providers.dart';
import '02_service/provider/shared_preferences_provider.dart';
import '04_theme/provider/theme_provider.dart';
import 'introduction/intro_page.dart';
import 'settings/settings_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const EasyLocalizator(),
    ),
  );
}

class EasyLocalizator extends ConsumerWidget {
  const EasyLocalizator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = ref.read(supportedLocalesProvider);
    final fallbackLocale = ref.read(fallbackLocaleProvider);

    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/languages',
      fallbackLocale: fallbackLocale,
      child: const MyApp(),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.read(sharedPreferencesProvider);
    final theme = ref.watch(themeChangeProvider).themeData;
    final isIntroViewed = sharedPreferences.getBool('intro_viewed') ?? false;
    String initialRoute;

    if (isIntroViewed) {
      initialRoute = routeToSettings;
    } else {
      initialRoute = routeToIntro;
      sharedPreferences.setBool('intro_viewed', true);
    }

    return MaterialApp(
      title: 'title'.tr(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: theme,
      initialRoute: initialRoute,
      routes: {
        routeToIntro: (context) => const IntroPage(),
        routeToSettings: (context) => const SettingsPage(),
      },
    );
  }
}
