import 'package:flutter/material.dart';
import 'package:flutter_bottom_sheet_navigations/bottom_sheet_page.dart';
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
    return const BottomSheetPage(
      child: SheetTopScreen(),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Bottm sheet navigation')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => const BottomSheetRoute().go(context),
              child: const Text('Bottom sheet with BottomSheetPage'),
            ),
            ElevatedButton(
              onPressed: () async {
                await showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) => Wrap(
                    children: [
                      MaterialApp.router(
                        routerConfig: GoRouter(
                          routes: [
                            $bottomSheetTopRoute,
                          ],
                          initialLocation: '/bottom-sheet-top',
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show modal bottom sheet'),
            ),
          ],
        ),
      );
}

class SheetTopScreen extends StatelessWidget {
  const SheetTopScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => const BottomSheetNextRoute().push(context),
              child: const Text('Next'),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      );
}

class NextSheetScreen extends StatelessWidget {
  const NextSheetScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Back'),
        ),
      );
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
  Widget build(BuildContext context, GoRouterState state) =>
      const BottomSheetTopScreen();
}

class BottomSheetTopScreen extends StatelessWidget {
  const BottomSheetTopScreen({super.key});

  @override
  Widget build(BuildContext context) => Wrap(children: [
        Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => const NextRoute().push(context),
                child: const Text('Next'),
              ),
              const Text('test'),
            ],
          ),
        )
      ]);
}

class NextRoute extends GoRouteData {
  const NextRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: const NextSheetScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
