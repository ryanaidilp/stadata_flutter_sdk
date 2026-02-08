import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({required this.publication, this.onTap, super.key});

  final Publication publication;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and ISSN
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cover image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 60,
                      height: 80,
                      child: Image.network(
                        publication.cover,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => ColoredBox(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainerLowest,
                              child: Icon(
                                Icons.article,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                size: 24,
                              ),
                            ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return ColoredBox(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerLowest,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const Gap(AppSizes.spaceMd),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          publication.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const Gap(AppSizes.spaceXs),

                        // ISSN
                        if (publication.issn.isNotEmpty) ...[
                          Text(
                            '${t.publications.fields.issn}: '
                            '${publication.issn}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const Gap(AppSizes.spaceXs),
                        ],

                        // File size
                        if (publication.size.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.file_download,
                                size: 14,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                              const Gap(AppSizes.spaceXs / 2),
                              Text(
                                '${t.publications.fields.size}: '
                                '${publication.size}',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const Gap(AppSizes.spaceXs),
                        ],

                        // Release date
                        if (publication.releaseDate != null) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                              const Gap(AppSizes.spaceXs / 2),
                              Text(
                                '${t.publications.fields.releaseDate}: '
                                '${_formatDate(publication.releaseDate!)}',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              // Abstract (if available)
              if (publication.abstract != null &&
                  publication.abstract!.isNotEmpty) ...[
                const Gap(AppSizes.spaceMd),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSizes.spaceSm),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.publications.fields.abstract,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(AppSizes.spaceXs),
                      Text(
                        publication.abstract!,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],

              // Action buttons
              const Gap(AppSizes.spaceMd),
              Row(
                children: [
                  // PDF download button
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle PDF download
                        // This would typically launch the URL
                      },
                      icon: const Icon(Icons.picture_as_pdf, size: 16),
                      label: const Text('PDF'),
                    ),
                  ),

                  const Gap(AppSizes.spaceSm),

                  // View details button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.visibility, size: 16),
                      label: Text(t.common.details),
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
