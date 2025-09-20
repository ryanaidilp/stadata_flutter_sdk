import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/features/domains/presentation/widgets/detail_row.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

/// A widget that displays request details for the news results page
class NewsResultsRequestDetailsPanel extends StatelessWidget {
  const NewsResultsRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsResultsCubit>();
        final requestDetails = cubit.lastRequestDetails;

        if (requestDetails == null) {
          return Container(
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.code,
                      color: Theme.of(context).colorScheme.primary,
                      size: AppSizes.iconMd,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      'Request Details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceMd),
                Text(
                  'No API request has been made yet. Execute a search to see request details.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.code,
                    color: Theme.of(context).colorScheme.primary,
                    size: AppSizes.iconMd,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Request Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spaceXs,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Text(
                      requestDetails.method,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // URL
              DetailRow(
                label: 'URL',
                value: requestDetails.url,
                isUrl: true,
                onCopy: () {
                  Clipboard.setData(ClipboardData(text: requestDetails.url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('URL copied to clipboard')),
                  );
                },
              ),

              const Gap(AppSizes.spaceSm),

              // Parameters
              DetailRow(
                label: 'Parameters',
                value: requestDetails.parameters.entries
                    .map((e) => '${e.key}: ${e.value}')
                    .join('\n'),
                onCopy: () {
                  final parametersText = requestDetails.parameters.entries
                      .map((e) => '${e.key}: ${e.value}')
                      .join('\n');
                  Clipboard.setData(ClipboardData(text: parametersText));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Parameters copied to clipboard'),
                    ),
                  );
                },
              ),

              const Gap(AppSizes.spaceSm),

              // Response Time
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: AppSizes.iconSm,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Response Time: ${requestDetails.responseTime?.inMilliseconds ?? 0}ms',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
