import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:woodscenter/main.dart';

import '../../../core/navigation/base_go_route_data.dart';
import '../register/registration_page.dart';
import '../signin/bloc/sign_in_bloc.dart';
import '../signin/sign_in_page.dart';

part 'authentication_graph.g.dart';

@TypedGoRoute<SignInRoute>(path: '/sign_in', routes: <TypedRoute<RouteData>>[])
@immutable
base class SignInRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => SignInBloc(getIt.get()),
      child: const SignInPage(),
    );
  }
}

@TypedGoRoute<RegistrationRoute>(path: '/registration', routes: <TypedRoute<RouteData>>[])
@immutable
base class RegistrationRoute extends BaseFadeTransitionGoRouteData {
  @override
  Widget pageChild(BuildContext context, GoRouterState state) {
    return const RegistrationPage();
  }
}

List<RouteBase> get $authenticationRoutes => $appRoutes;
