import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/provider/theme_mode_provider.dart';
import '../../core/widget/page_foundation.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) => PageFoundation(
    appBar: AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'title'.tr(),
      ),
    ),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: () => context.locale.languageCode == 'en'
                ? context.setLocale(const Locale('ru'))
                : context.setLocale(const Locale('en')),
            child: const Text('change_lang').tr(),
          ),
          TextButton(
            onPressed: () => ref.read(themeModeProvider.notifier).switchTheme(),
            child: const Text('change_theme').tr(),
          ),
        ],
      ),
    ),
  );
}
