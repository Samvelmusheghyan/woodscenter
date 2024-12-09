// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residents_graph.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $residentsRoute,
    ];

RouteBase get $residentsRoute => GoRouteData.$route(
      path: '/main_residents',
      factory: $ResidentsRouteExtension._fromState,
    );

extension $ResidentsRouteExtension on ResidentsRoute {
  static ResidentsRoute _fromState(GoRouterState state) => ResidentsRoute();

  String get location => GoRouteData.$location(
        '/main_residents',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
