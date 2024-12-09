import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/navigation/base_go_route_data.dart';
import '../contacts_page.dart';

part 'contact_graph.g.dart';

@TypedGoRoute<ContactsRoute>(path: '/main_contacts', routes: <TypedRoute<RouteData>>[])
@immutable
base class ContactsRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const ContactPage();
  }
}

List<RouteBase> get $contactRoutes => $appRoutes;
