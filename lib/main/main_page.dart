import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:woodscenter/core/common/utils/extensions/color_ext.dart';
import 'package:woodscenter/main/top_level_destinations.dart';

class MainPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage(this.navigationShell, {super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  //  BackButtonInterceptor.add(backInterceptor);
  }

  bool backInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (widget.navigationShell.currentIndex != TopLevelDestinations.home.index && context.canPop() == false) {
      widget.navigationShell.goBranch(TopLevelDestinations.home.index, initialLocation: false);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: NavigationBar(
          destinations: [
            ...TopLevelDestinations.values.map((value) {
              return NavigationDestination(
                icon: Icon(value.icon),
                selectedIcon: Icon(value.icon, color: context.primary),
                label: value.label,
              );
            })
          ],
          elevation: 0,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          backgroundColor: context.colorScheme.onTertiary,
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: _onNavigationDestinationSelected,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          indicatorColor: context.colorScheme.onTertiary,
          animationDuration: Duration.zero,
        ),
      ),
    );
  }

  void _onNavigationDestinationSelected(int index) {
    if (index != widget.navigationShell.currentIndex) {
      widget.navigationShell.goBranch(index, initialLocation: false);
    }
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backInterceptor);
    super.dispose();
  }
}
