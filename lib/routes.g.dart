// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $bottomSheetTopRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'bottom-sheet-home',
          factory: $BottomSheetRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'next',
              factory: $BottomSheetNextRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BottomSheetRouteExtension on BottomSheetRoute {
  static BottomSheetRoute _fromState(GoRouterState state) =>
      const BottomSheetRoute();

  String get location => GoRouteData.$location(
        '/bottom-sheet-home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BottomSheetNextRouteExtension on BottomSheetNextRoute {
  static BottomSheetNextRoute _fromState(GoRouterState state) =>
      const BottomSheetNextRoute();

  String get location => GoRouteData.$location(
        '/bottom-sheet-home/next',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $bottomSheetTopRoute => GoRouteData.$route(
      path: '/bottom-sheet-top',
      factory: $BottomSheetTopRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'next',
          factory: $NextRouteExtension._fromState,
        ),
      ],
    );

extension $BottomSheetTopRouteExtension on BottomSheetTopRoute {
  static BottomSheetTopRoute _fromState(GoRouterState state) =>
      const BottomSheetTopRoute();

  String get location => GoRouteData.$location(
        '/bottom-sheet-top',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NextRouteExtension on NextRoute {
  static NextRoute _fromState(GoRouterState state) => const NextRoute();

  String get location => GoRouteData.$location(
        '/bottom-sheet-top/next',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
