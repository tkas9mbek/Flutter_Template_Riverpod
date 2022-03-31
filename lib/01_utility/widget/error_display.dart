import 'package:flutter/material.dart';

import '../../02_theme/font.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    this.error,
    this.errorCode,
    this.message,
    Key? key,
  }) : super(key: key);

  final Object? error;
  final int? errorCode;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: colorScheme.error,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Text(
        message ?? error.toString(),
        style: MyFont.style(
          fontSize: 16,
          color: colorScheme.onError,
        ),
      ),
    );
  }
}
