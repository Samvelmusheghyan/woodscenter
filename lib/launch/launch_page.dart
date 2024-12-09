import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../feature/authentication/navigation/authentication_graph.dart';
import '../feature/home/navigation/home_graph.dart';

class LaunchPage extends HookWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    _initApp(context);

    return Scaffold(
      body: Center(
        child: SvgPicture.network("https://woodscenter.am/assets/images/logo.svg"),
      ),
    );
  }

  void _initApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    SignInRoute().go(context);
  }
}
