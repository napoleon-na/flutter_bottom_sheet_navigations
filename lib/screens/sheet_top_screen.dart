import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SheetTopScreen extends StatelessWidget {
  const SheetTopScreen({
    required this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
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
