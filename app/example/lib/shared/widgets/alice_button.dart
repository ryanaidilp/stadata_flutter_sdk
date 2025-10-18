import 'package:flutter/material.dart';
import 'package:stadata_example/core/network/alice_service.dart';

/// Alice HTTP Inspector button widget
///
/// Provides a consistent Alice inspector button that can be used
/// in app bars across all pages. Only visible in debug mode.
class AliceButton extends StatelessWidget {
  const AliceButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!AliceService.isAvailable) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: const Icon(Icons.bug_report),
      onPressed: () => AliceService.openInspector(context),
      tooltip: 'Open HTTP Inspector',
    );
  }
}
