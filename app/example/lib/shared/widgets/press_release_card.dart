import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleaseCard extends StatelessWidget {
  const PressReleaseCard({required this.pressRelease, this.onTap, super.key});

  final PressRelease pressRelease;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 60,
                      height: 80,
                      child: Image.network(
                        pressRelease.cover,
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

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pressRelease.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const Gap(AppSizes.spaceXs),

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
                              'Release Date: '
                              '${_formatDate(pressRelease.releaseDate)}',
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

                        if (pressRelease.size.isNotEmpty) ...[
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
                                'Size: '
                                '${pressRelease.size}',
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
                      ],
                    ),
                  ),
                ],
              ),

              if (pressRelease.abstract != null &&
                  pressRelease.abstract!.isNotEmpty) ...[
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
                        'Abstract',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Gap(AppSizes.spaceXs),
                      HtmlTextWidget(
                        data: pressRelease.abstract!,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],

              const Gap(AppSizes.spaceMd),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.picture_as_pdf, size: 16),
                      label: const Text('PDF'),
                    ),
                  ),

                  const Gap(AppSizes.spaceSm),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.visibility, size: 16),
                      label: const Text('Details'),
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
