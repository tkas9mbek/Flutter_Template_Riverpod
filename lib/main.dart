import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL_raleway.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

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
    final supportedLocales = ref.watch(supportedLocalesProvider);
    final fallbackLocale = ref.watch(fallbackLocaleProvider);

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
    final fallbackLocale = ref.watch(fallbackLocaleProvider);
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
      localeResolutionCallback: (locale, supportedLocales) {
        if (!supportedLocales.contains(locale)) {
          context.setLocale(fallbackLocale);

          return context.fallbackLocale;
        }

        return locale;
      },
      theme: theme,
      initialRoute: initialRoute,
      routes: {
        routeToIntro: (context) => const IntroPage(),
        routeToSettings: (context) => const SettingsPage(),
      },
    );
  }
}
