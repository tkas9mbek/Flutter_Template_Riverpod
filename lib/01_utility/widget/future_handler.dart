import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/provider_response.dart';
import 'error_display.dart';

class FutureHandler<T> extends ConsumerWidget {
  const FutureHandler({
    required this.onSuccess,
    this.provider,
    this.data,
    this.loader = const CircularProgressIndicator(),
    Key? key,
  }) : super(key: key);

  final FutureProvider? provider;
  final AsyncValue<ProviderResponse>? data;
  final Widget loader;
  final Widget Function(T data) onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureValue = provider != null
        ? ref.watch(provider!)
        : data;

    if (futureValue != null) {
      return futureValue.when(
        error: (err, s) => ErrorDisplay(error: err),
        loading: () => loader,
        data: (dynamic response) {
          if (response is ProviderResponse<T> && response.data != null) {
            if (response.status) {
              return onSuccess(response.data as T);
            } else {
              return ErrorDisplay(
                errorCode: response.errorCode,
                message: response.message,
              );
            }
          } else {
            throw UnimplementedError();
          }
        },);
    } else {
      throw UnimplementedError();
    }
  }
}
