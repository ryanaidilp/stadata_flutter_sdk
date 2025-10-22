import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDatasetCard extends StatelessWidget {
  const CensusDatasetCard({required this.dataset, super.key});

  final CensusDataset dataset;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with ID badge
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceXs,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${t.censusDatasets.fields.id}: ${dataset.id}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.purple.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Gap(AppSizes.spaceXs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceXs,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${t.censusDatasets.fields.eventID}: ${dataset.eventID}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const Gap(AppSizes.spaceSm),

            // Dataset Name
            Text(
              dataset.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const Gap(AppSizes.spaceXs),

            // Topic
            Row(
              children: [
                Icon(
                  Icons.topic_outlined,
                  size: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const Gap(AppSizes.spaceXs),
                Expanded(
                  child: Text(
                    '${t.censusDatasets.fields.topic}: ${dataset.topic}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),

            // Description (if available)
            if (dataset.description != null &&
                dataset.description!.isNotEmpty) ...[
              const Gap(AppSizes.spaceXs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.description_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Expanded(
                    child: Text(
                      dataset.description!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
