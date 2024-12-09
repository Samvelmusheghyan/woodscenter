import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../feature/book/navigation/book_graph.dart';
import '../../feature/contacts/navigation/contact_graph.dart';
import '../../feature/home/navigation/home_graph.dart';
import '../../feature/residents/navigation/residents_graph.dart';
import '../main_page.dart';

part 'main_graph.g.dart';

@TypedStatefulShellRoute<MainShellRoute>(branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
  TypedStatefulShellBranch<HomeShellRoute>(routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path:'/main_home'),
  ]),
  TypedStatefulShellBranch<BookShellRoute>(routes: <TypedRoute<RouteData>>[
    TypedGoRoute<BookRoute>(path: "/main_book"),
  ]),
  TypedStatefulShellBranch<ResidentsShellRoute>(routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ResidentsRoute>(path: "/main_residents"),
  ]),
  TypedStatefulShellBranch<ContactsShellRoute>(routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ContactsRoute>(path: "/main_contacts"),
  ]),
])
class MainShellRoute extends StatefulShellRouteData {
  const MainShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
    return MainPage(navigationShell);
  }
}

class HomeShellRoute extends StatefulShellBranchData {
  const HomeShellRoute();
}

class ContactsShellRoute extends StatefulShellBranchData {
  const ContactsShellRoute();
}

class ResidentsShellRoute extends StatefulShellBranchData {
  const ResidentsShellRoute();
}


class BookShellRoute extends StatefulShellBranchData {
  const BookShellRoute();
}

List<RouteBase> get $mainRoutes => $appRoutes;