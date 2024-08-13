import 'package:flutter/material.dart';
import 'package:flutter_bottom_sheet_navigations/bottom_sheet_page.dart';
import 'package:flutter_bottom_sheet_navigations/screens/home_screen.dart';
import 'package:flutter_bottom_sheet_navigations/screens/next_sheet_screen.dart';
import 'package:flutter_bottom_sheet_navigations/screens/sheet_top_screen.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<BottomSheetRoute>(
      path: 'bottom-sheet-home',
      routes: [
        TypedGoRoute<BottomSheetNextRoute>(
          path: 'next',
        ),
      ],
    ),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class BottomSheetRoute extends GoRouteData {
  const BottomSheetRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      child: SheetTopScreen(
        onPressed: () => const BottomSheetNextRoute().push(context),
      ),
    );
  }
}

class BottomSheetNextRoute extends GoRouteData {
  const BottomSheetNextRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const BottomSheetPage(
      child: NextSheetScreen(),
    );
  }
}

@TypedGoRoute<BottomSheetTopRoute>(
  path: '/bottom-sheet-top',
  routes: [
    TypedGoRoute<NextRoute>(
      path: 'next',
    ),
  ],
)
class BottomSheetTopRoute extends GoRouteData {
  const BottomSheetTopRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SheetTopScreen(
        onPressed: () => const NextRoute().push(context),
      );
}

class NextRoute extends GoRouteData {
  const NextRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NextSheetScreen();
}

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<ShellContentTopRoute>(
      path: '/shell-bottom-sheet-home',
      routes: [
        TypedGoRoute<ShellContentNextRoute>(
          path: 'shell-next',
        ),
      ],
    ),
  ],
)
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  static final $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'MyShellRoute');

  @override
  Page<void> pageBuilder(
      BuildContext context, GoRouterState state, Widget navigator) {
    return BottomSheetPage(
      child: Wrap(
        children: [navigator],
      ),
      showDragHandle: true,
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}

class ShellContentTopRoute extends GoRouteData {
  const ShellContentTopRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SheetTopScreen(
      onPressed: () => const ShellContentNextRoute().push(context),
    );
  }
}

class ShellContentNextRoute extends GoRouteData {
  const ShellContentNextRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NextSheetScreen();
  }
}
