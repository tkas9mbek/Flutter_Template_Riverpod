import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/font.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/transparent_app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PageFoundation(
      hasDrawer: true,
      backgroundColor: colorScheme.primary,
      appBar: TransparentAppBar(
        title: 'title'.tr(),
        leadingType: TransparentLeadingType.drawer,
      ),
      body: Center(
        child: Text(
          'title'.tr(),
          style: MyFont.style(
            color: colorScheme.onBackground,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
