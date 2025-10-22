import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDataCard extends StatelessWidget {
  const CensusDataCard({required this.data, super.key});

  final CensusData data;

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
            // Header with region and indicator
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Region
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const Gap(AppSizes.spaceXs),
                          Expanded(
                            child: Text(
                              data.regionName,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(AppSizes.spaceXs),
                      // Region code
                      Text(
                        '${t.censusData.fields.regionCode}: ${data.regionCode}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Gap(AppSizes.spaceSm),
            Divider(color: theme.colorScheme.outlineVariant),
            const Gap(AppSizes.spaceSm),

            // Indicator Name
            Text(
              data.indicatorName,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const Gap(AppSizes.spaceXs),

            // Indicator ID
            Text(
              '${t.censusData.fields.indicatorID}: ${data.indicatorID}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            if (data.categories.isNotEmpty) ...[
              const Gap(AppSizes.spaceSm),
              // Categories
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children:
                    data.categories.map((category) {
                      return Chip(
                        label: Text(
                          '${category.name}: ${category.itemName}',
                          style: theme.textTheme.labelSmall,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceXs,
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    }).toList(),
              ),
            ],

            const Gap(AppSizes.spaceSm),
            Divider(color: theme.colorScheme.outlineVariant),
            const Gap(AppSizes.spaceSm),

            // Value and Period
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Period
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      '${t.censusData.fields.period}: ${data.period}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                // Value
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.spaceSm,
                    vertical: AppSizes.spaceXs,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${t.censusData.fields.value}: ${data.value}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
