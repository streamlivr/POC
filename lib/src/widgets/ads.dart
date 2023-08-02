import 'package:flutter/material.dart';

class AdsDialog extends StatelessWidget {
  const AdsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rate Us!'),
      content: const Text('Enjoying the app? Please take a moment to rate it.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false); // User declined to rate
          },
          child: const Text('Not Now'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true); // User agreed to rate
          },
          child: const Text('Rate Now'),
        ),
      ],
    );
  }
}
