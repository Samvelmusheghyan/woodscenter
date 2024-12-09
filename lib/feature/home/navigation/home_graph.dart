import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/base_go_route_data.dart';
import '../home_page.dart';

part 'home_graph.g.dart';

@TypedGoRoute<HomeRoute>(path: '/main_home', routes: <TypedRoute<RouteData>>[])
@immutable
base class HomeRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

List<RouteBase> get $homeRoutes => $appRoutes;
