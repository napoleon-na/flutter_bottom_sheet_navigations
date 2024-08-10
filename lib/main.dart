import 'package:flutter/material.dart';
import 'package:flutter_bottom_sheet_navigations/routes.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: GoRouter(routes: $appRoutes),
        title: 'Bottom Sheet Navigation',
      );
}
