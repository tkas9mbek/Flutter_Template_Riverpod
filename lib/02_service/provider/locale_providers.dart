import 'dart:io';
import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/**
    Local of the platform (e.g. phone)
 */
final platformLocaleProvider = Provider<Locale>((ref) {
  final _platformLocaleName = Platform.localeName;
  String _languageCode;

  if (Platform.isIOS) {
    _languageCode = _platformLocaleName;
  } else {
    _languageCode = _platformLocaleName.substring(0, _platformLocaleName.indexOf('_'));
  }

  return Locale(_languageCode);
});

/**
    The default local if locale is selected yet
 */
final fallbackLocaleProvider = Provider<Locale>((ref) {
  final _platformLocale = ref.watch(platformLocaleProvider);
  final _supportedLocales = ref.watch(supportedLocalesProvider);

  return _supportedLocales.contains(_platformLocale)
      ? _platformLocale
      : _supportedLocales[0];
});

/**
    Provides the list of the supported current locales and language codee.
 */
final supportedLanguageCodesProvider = Provider<List<String>>((ref) => const [
    'en',
    'ru',
  ],
);

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  final _supportedLanguages = ref.watch(supportedLanguageCodesProvider);

  return _supportedLanguages.map(Locale.new).toList();
});
