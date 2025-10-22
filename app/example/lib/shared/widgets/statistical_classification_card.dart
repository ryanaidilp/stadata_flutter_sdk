import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalClassificationCard extends StatelessWidget {
  const StatisticalClassificationCard({
    required this.statisticalClassification,
    super.key,
  });

  final StatisticClassification statisticalClassification;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final dateFormat = DateFormat('dd MMM yyyy');

    String getTypeLabel(ClassificationType? type) {
      if (type == null) return '-';
      if (type is KBLIType) {
        return 'KBLI ${type.year}';
      }
      return type.value;
    }

    String getLevelLabel(ClassificationLevel? level) {
      if (level == null) return '-';
      if (level is KBLILevel) {
        return switch (level) {
          KBLILevel.category => t.statisticalClassifications.levels.category,
          KBLILevel.primaryGroup =>
            t.statisticalClassifications.levels.primaryGroup,
          KBLILevel.group => t.statisticalClassifications.levels.group,
          KBLILevel.subGroup => t.statisticalClassifications.levels.subGroup,
          KBLILevel.cluster => t.statisticalClassifications.levels.cluster,
        };
      }
      return level.value;
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: InkWell(
        onTap: () {
          // Could navigate to detail page if implemented
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ID and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceXs,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Text(
                      statisticalClassification.id,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  Expanded(
                    child: Text(
                      statisticalClassification.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceSm),

              // Type and Level badges
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children: [
                  if (statisticalClassification.type != null)
                    Chip(
                      label: Text(
                        getTypeLabel(statisticalClassification.type),
                        style: theme.textTheme.labelSmall,
                      ),
                      backgroundColor: Colors.blue.shade50,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  if (statisticalClassification.level != null)
                    Chip(
                      label: Text(
                        getLevelLabel(statisticalClassification.level),
                        style: theme.textTheme.labelSmall,
                      ),
                      backgroundColor: Colors.purple.shade50,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                ],
              ),

              const Gap(AppSizes.spaceSm),

              // Source
              if (statisticalClassification.source.isNotEmpty) ...[
                Row(
                  children: [
                    Icon(
                      Icons.source,
                      size: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      '${t.statisticalClassifications.fields.source}: ',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        statisticalClassification.source,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceXs),
              ],

              // Description
              if (statisticalClassification.description.isNotEmpty) ...[
                Text(
                  statisticalClassification.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(AppSizes.spaceSm),
              ],

              // Release Date
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    '${t.statisticalClassifications.fields.releaseDate}: ',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    dateFormat.format(statisticalClassification.releaseDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
