import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../00_value/route_paths.dart';

class IntroPage extends ConsumerStatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends ConsumerState<IntroPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    context.go(routeToSettings);
  }

  @override
  Widget build(BuildContext context) {
    final introPage = PageViewModel(
      title: 'intro_title'.tr(),
      body: 'intro_body'.tr(),
      image: const Icon(Icons.receipt_long),
    );

    return SafeArea(
      child: IntroductionScreen(
        key: _introKey,
        globalBackgroundColor: Colors.white,
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text('end').tr(),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
        pages: [
          introPage,
          introPage,
          introPage,
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('skip').tr(),
        done: const Text('done').tr(),
        next: const Icon(Icons.arrow_forward),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
