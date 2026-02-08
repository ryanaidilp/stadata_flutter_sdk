import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassificationMetadataCard extends StatelessWidget {
  const ClassificationMetadataCard({
    required this.classification,
    super.key,
  });

  final StatisticClassification classification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = LocaleSettings.instance.currentTranslations;
    final dateFormat = DateFormat('dd MMM yyyy');

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  t.statisticalClassifications.detail.metadata,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceSm),
            const Divider(height: 1),
            const Gap(AppSizes.spaceSm),

            // Source
            _MetadataRow(
              icon: Icons.source_outlined,
              label: t.statisticalClassifications.detail.source,
              value: classification.source,
              theme: theme,
            ),

            // Release Date
            _MetadataRow(
              icon: Icons.calendar_today_outlined,
              label: t.statisticalClassifications.detail.releaseDate,
              value: dateFormat.format(classification.releaseDate),
              theme: theme,
            ),

            // Last Update
            _MetadataRow(
              icon: Icons.update_outlined,
              label: t.statisticalClassifications.detail.lastUpdate,
              value: dateFormat.format(classification.lastUpdate),
              theme: theme,
            ),

            // Level
            if (classification.level != null)
              _MetadataRow(
                icon: Icons.layers_outlined,
                label: t.statisticalClassifications.detail.level,
                value: classification.level!.value.toUpperCase(),
                theme: theme,
              ),

            // URL
            if (classification.url != null) ...[
              const Gap(AppSizes.spaceXs),
              Row(
                children: [
                  Icon(
                    Icons.link_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Expanded(
                    child: InkWell(
                      onTap: () => _launchURL(classification.url!),
                      child: Text(
                        t.statisticalClassifications.detail.viewOnline,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ],

            // Tags
            if (classification.tags.isNotEmpty) ...[
              const Gap(AppSizes.spaceMd),
              Row(
                children: [
                  Icon(
                    Icons.label_outline,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.statisticalClassifications.detail.tags,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceXs),
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children:
                    classification.tags.take(10).map((tag) {
                      return Chip(
                        label: Text(
                          tag,
                          style: theme.textTheme.labelSmall,
                        ),
                        backgroundColor: theme.colorScheme.secondaryContainer
                            .withValues(
                              alpha: 0.5,
                            ),
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _MetadataRow extends StatelessWidget {
  const _MetadataRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(AppSizes.spaceXs),
                Flexible(
                  child: Text(
                    value,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
