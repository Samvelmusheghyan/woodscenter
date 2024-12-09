import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/base_go_route_data.dart';
import '../residents_page.dart';

part 'residents_graph.g.dart';

@TypedGoRoute<ResidentsRoute>(path: '/main_residents', routes: <TypedRoute<RouteData>>[])
@immutable
base class ResidentsRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const ResidentsPage();
  }
}

List<RouteBase> get $residentsRoutes => $appRoutes;
