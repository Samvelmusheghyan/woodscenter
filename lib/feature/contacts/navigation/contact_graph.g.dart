// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_graph.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $contactsRoute,
    ];

RouteBase get $contactsRoute => GoRouteData.$route(
      path: '/main_contacts',
      factory: $ContactsRouteExtension._fromState,
    );

extension $ContactsRouteExtension on ContactsRoute {
  static ContactsRoute _fromState(GoRouterState state) => ContactsRoute();

  String get location => GoRouteData.$location(
        '/main_contacts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
