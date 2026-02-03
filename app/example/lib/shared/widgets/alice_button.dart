import 'package:flutter/material.dart';
import 'package:stadata_example/core/network/alice_service.dart';

/// Alice HTTP Inspector button widget
///
/// Provides a consistent Alice inspector button that can be used
/// in app bars across all pages. Always visible in example app for showcase.
class AliceButton extends StatelessWidget {
  const AliceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bug_report),
      onPressed: () => AliceService.openInspector(context),
      tooltip: 'Open HTTP Inspector',
    );
  }
}
