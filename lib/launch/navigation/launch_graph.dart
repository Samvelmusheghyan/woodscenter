import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/navigation/base_go_route_data.dart';
import '../launch_page.dart';

part 'launch_graph.g.dart';

@TypedGoRoute<LaunchRoute>(path: '/launch', routes: <TypedRoute<RouteData>>[])
@immutable
base class LaunchRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const LaunchPage();
  }
}

List<RouteBase> get $launchRoutes => $appRoutes;
