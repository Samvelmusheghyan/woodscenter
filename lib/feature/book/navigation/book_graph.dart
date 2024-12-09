import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/base_go_route_data.dart';
import '../book_page.dart';

part 'book_graph.g.dart';

@TypedGoRoute<BookRoute>(path: '/main_book', routes: <TypedRoute<RouteData>>[])
@immutable
base class BookRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const BookPage();
  }
}

List<RouteBase> get $bookRoutes => $appRoutes;
