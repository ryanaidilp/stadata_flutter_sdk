import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';

/// A widget for displaying code snippets with syntax highlighting placeholder
class CodeSnippetWidget extends StatelessWidget {
  const CodeSnippetWidget({
    super.key,
    required this.code,
    this.language = 'text',
  });

  final String code;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceSm),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SelectableText(
              code,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _copyToClipboard(context),
            icon: const Icon(Icons.copy, size: 16),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
            tooltip: context.t.shared.codeSnippet.copyToClipboard,
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.t.shared.codeSnippet.codeCopied),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
