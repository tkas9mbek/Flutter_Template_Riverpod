import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/route_data.dart';

final drawerRoutesProvider = Provider<List<RouteData>>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData.where((e) => e.location == RouteLocation.drawer
      || e.location == RouteLocation.both,).toList();
});

final bottomNavigationRoutesProvider = Provider<List<RouteData>>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData.where((e) => e.location == RouteLocation.bottom
      || e.location == RouteLocation.both,).toList();
});

final routeDataProvider = Provider<List<RouteData>>((ref) => [
  // Here are your route data
],);
