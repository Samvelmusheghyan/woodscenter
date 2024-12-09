import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:woodscenter/feature/book/navigation/book_graph.dart';
import 'package:woodscenter/feature/contacts/navigation/contact_graph.dart';
import 'package:woodscenter/feature/home/navigation/home_graph.dart';
import 'package:woodscenter/feature/residents/navigation/residents_graph.dart';
import 'package:woodscenter/main/navigation/main_graph.dart';

import 'feature/authentication/navigation/authentication_graph.dart';
import 'launch/navigation/launch_graph.dart';

final GoRouter router = GoRouter(routes: [
  ...$launchRoutes,
  ...$authenticationRoutes,
  ...$mainRoutes,
  ...$bookRoutes,
  ...$contactRoutes,
  ...$homeRoutes,
  ...$residentsRoutes,
], initialLocation: LaunchRoute().location);

class WoodsCenterApp extends HookWidget {
  const WoodsCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// Localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      /// Navigation
      routerConfig: router,

      /// App settings
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
