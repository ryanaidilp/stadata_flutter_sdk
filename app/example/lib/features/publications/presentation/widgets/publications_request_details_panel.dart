import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';

class PublicationsRequestDetailsPanel extends StatelessWidget {
  const PublicationsRequestDetailsPanel({
    required this.requestDetails,
    super.key,
  });

  final RequestDetails? requestDetails;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.api,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              t.publications.requestDetails.title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Gap(AppSizes.spaceSm),
        if (requestDetails != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${t.publications.requestDetails.method}: ${requestDetails!.method}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  '${t.publications.requestDetails.url}: ${requestDetails!.url}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  '${t.publications.requestDetails.responseTime}: ${requestDetails!.responseTime?.inMilliseconds ?? 0}ms',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              t.publications.requestDetails.noRequest,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
      ],
    );
  }
}
