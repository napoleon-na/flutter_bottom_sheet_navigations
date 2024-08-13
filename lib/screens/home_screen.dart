import 'package:flutter/material.dart';
import 'package:flutter_bottom_sheet_navigations/routes.dart';
import 'package:go_router/go_router.dart';

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
                  isScrollControlled: false,
                  builder: (BuildContext context) {
                    return Wrap(
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
                    );
                  },
                );
              },
              child: const Text('Show modal bottom sheet'),
            ),
            ElevatedButton(
              onPressed: () => const ShellContentTopRoute().push(context),
              child: const Text('Bottom sheet in shell route'),
            ),
          ],
        ),
      );
}
