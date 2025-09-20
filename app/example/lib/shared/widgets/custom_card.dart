import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/utils/date_formatter.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    required this.title,
    this.subtitle,
    this.description,
    this.imageUrl,
    this.date,
    this.tags,
    this.onTap,
    this.trailing,
    this.backgroundColor,
  });

  final String title;
  final String? subtitle;
  final String? description;
  final String? imageUrl;
  final DateTime? date;
  final List<String>? tags;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  child: ExtendedImage.network(
                    imageUrl!,
                    height: AppSizes.imageCardSize,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadStateChanged: (state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.loading:
                          return Container(
                            height: AppSizes.imageCardSize,
                            color: theme.colorScheme.surfaceContainerHighest,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        case LoadState.failed:
                          return Container(
                            height: AppSizes.imageCardSize,
                            color: theme.colorScheme.surfaceContainerHighest,
                            child: Icon(
                              Icons.broken_image,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          );
                        case LoadState.completed:
                          return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: AppSizes.spaceMd),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: AppSizes.spaceXs),
                          Text(
                            subtitle!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (description != null) ...[
                          const SizedBox(height: AppSizes.spaceXs),
                          Text(
                            description!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        if (date != null) ...[
                          const SizedBox(height: AppSizes.spaceXs),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: AppSizes.iconXs,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: AppSizes.spaceXs),
                              Text(
                                DateFormatter.formatDate(date!),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (tags != null && tags!.isNotEmpty) ...[
                          const SizedBox(height: AppSizes.spaceXs),
                          Wrap(
                            spacing: AppSizes.spaceXs,
                            runSpacing: AppSizes.spaceXs,
                            children:
                                tags!
                                    .take(3)
                                    .map(
                                      (tag) => Chip(
                                        label: Text(
                                          tag,
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: AppSizes.spaceXs),
                    trailing!,
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: ListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        leading: leading,
        trailing: trailing ?? const Icon(Icons.chevron_right),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spaceMd,
          vertical: AppSizes.spaceXs,
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
    this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.spaceSm),
                decoration: BoxDecoration(
                  color: color ?? theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Icon(
                  icon,
                  size: AppSizes.iconMd,
                  color:
                      color != null
                          ? Colors.white
                          : theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: AppSizes.spaceSm),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.spaceXs),
              Expanded(
                child: Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
