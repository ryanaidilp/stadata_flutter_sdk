import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticTableCard extends StatelessWidget {
  const StaticTableCard({
    required this.staticTable,
    this.onViewTable,
    super.key,
  });

  final StaticTable staticTable;
  final VoidCallback? onViewTable;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              staticTable.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const Gap(AppSizes.spaceSm),

            // Subject
            if (staticTable.subject != null) ...[
              Row(
                children: [
                  Icon(
                    Icons.topic,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs / 2),
                  Expanded(
                    child: Text(
                      'Subject: ${staticTable.subject}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceXs),
            ],

            // File size
            Row(
              children: [
                Icon(
                  Icons.insert_drive_file,
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const Gap(AppSizes.spaceXs / 2),
                Text(
                  'Size: ${staticTable.size}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            const Gap(AppSizes.spaceXs),

            // Updated date
            Row(
              children: [
                Icon(
                  Icons.update,
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const Gap(AppSizes.spaceXs / 2),
                Text(
                  'Updated: ${_formatDate(staticTable.updatedAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            // Action buttons
            const Gap(AppSizes.spaceMd),
            Row(
              children: [
                // View Table button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onViewTable,
                    icon: const Icon(Icons.table_view, size: 16),
                    label: const Text('View Table'),
                  ),
                ),

                const Gap(AppSizes.spaceSm),

                // Download Excel button
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _launchExcelUrl(context),
                    icon: const Icon(Icons.download, size: 16),
                    label: const Text('Download'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _launchExcelUrl(BuildContext context) async {
    final url = Uri.parse(staticTable.excel);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Cannot open URL'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    } on Exception catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Download failed'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
