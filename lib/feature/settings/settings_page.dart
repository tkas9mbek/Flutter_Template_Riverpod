import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/provider/theme_mode_provider.dart';
import '../../core/theme/styles.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/shadow_text_button.dart';
import '../../core/widget/transparent_app_bar.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PageFoundation(
    backgroundColor: colorScheme.primary,
    padding: Styles.generalBodyPadding,
    appBar: TransparentAppBar(
      title: 'settings'.tr(),
    ),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ShadowTextButton(
            onClick: () => ref.read(themeModeProvider.notifier).switchTheme(),
            text: 'change_theme'.tr(),
          ),
        ],
      ),
    ),
  );
  }
}
