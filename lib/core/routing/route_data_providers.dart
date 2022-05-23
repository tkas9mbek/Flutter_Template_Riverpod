import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../localization/locale_change_provider.dart';
import 'route_data.dart';
import 'route_paths.dart';

final drawerRoutesProvider = Provider<List<RouteData>>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData
      .where(
        (e) => e.location == RouteLocation.drawer || e.location == RouteLocation.both,
      )
      .toList();
});

final bottomNavigationRoutesProvider = Provider<List<RouteData>>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData.where((e) => e.location == RouteLocation.bottom
      || e.location == RouteLocation.both,).toList();
});

final homeRouteProvider = Provider<RouteData>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData.firstWhere((e) => e.location == RouteLocation.home);
});

final routeDataProvider = Provider<List<RouteData>>(
  (ref) {
    ref.watch(localeChangeProvider);

    return [
      RouteData(
        name: 'settings'.tr(),
        route: routeToSettings,
        location: RouteLocation.drawer,
      ),
      RouteData(
        name: 'intro'.tr(),
        route: routeToIntro,
        location: RouteLocation.drawer,
      ),
    ];
  },
);
