// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_graph.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $bookRoute,
    ];

RouteBase get $bookRoute => GoRouteData.$route(
      path: '/main_book',
      factory: $BookRouteExtension._fromState,
    );

extension $BookRouteExtension on BookRoute {
  static BookRoute _fromState(GoRouterState state) => BookRoute();

  String get location => GoRouteData.$location(
        '/main_book',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
