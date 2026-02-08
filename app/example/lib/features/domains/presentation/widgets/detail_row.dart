import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';

/// A reusable detail row widget
class DetailRow extends StatelessWidget {
  const DetailRow({
    required this.label,
    required this.value,
    this.isUrl = false,
    this.onCopy,
    this.maxLines,
    super.key,
  });

  final String label;
  final String value;
  final bool isUrl;
  final VoidCallback? onCopy;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          isUrl ? Theme.of(context).colorScheme.primary : null,
                    ),
                    maxLines: maxLines,
                    overflow: maxLines != null ? TextOverflow.ellipsis : null,
                  ),
                ),
                if (onCopy != null) ...[
                  const Gap(AppSizes.spaceXs),
                  IconButton(
                    onPressed: onCopy,
                    icon: const Icon(Icons.copy, size: 16),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
