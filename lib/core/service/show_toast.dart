import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../client/provider_response.dart';

void showToast(
  BuildContext context, {
  ProviderResponse? response,
  String? message,
  bool? success,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  var text = message ?? '';
  var positive = success ?? false;

  if (response != null) {
    positive = response.status;

    if (response.message != null) {
      text = positive ? response.message.toString() : '${'error.title'.tr()}\n${response.message}';
    } else {
      text = positive ? 'success.default'.tr() : '${'error.title'.tr()}\n${'error.default'.tr()}';
    }
  }

  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    textColor: positive ? colorScheme.onPrimaryContainer : colorScheme.onErrorContainer,
    backgroundColor: positive ? colorScheme.primaryContainer : colorScheme.errorContainer,
    fontSize: 16,
  );
}
