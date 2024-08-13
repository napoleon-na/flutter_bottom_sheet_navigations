import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NextSheetScreen extends StatelessWidget {
  const NextSheetScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Back'),
            ),
            const Text('test'),
            const Text('test'),
            const Text('test'),
            const Text('test'),
          ],
        ),
      );
}
