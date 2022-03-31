import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../02_theme/provider/extra_color_scheme_provider.dart';
import 'model/client_response.dart';

void showToast(WidgetRef ref, {
  ClientResponse? response,
  String? message,
  bool? positive,
}) {
  final extraColors = ref.watch(extraColorSchemeProvider);
  var text = message ?? '';
  var success = positive ?? true;

  if (response != null) {
    success = response.status;
    text = success
        ? 'success.positive'.tr()
        : '${'error.default'.tr()}\nError   code: ${response.errorCode}';
  }

  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: success
        ? extraColors.toastPositive
        : extraColors.toastNegative,
    fontSize: 16,
  );
}
