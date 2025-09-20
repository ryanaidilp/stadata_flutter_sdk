import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/domains/presentation/widgets/detail_row.dart';
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

/// A widget that displays infographics API request details for results page
class InfographicsResultsRequestDetailsPanel extends StatelessWidget {
  const InfographicsResultsRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<InfographicsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<InfographicsResultsCubit>();
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
                      t.infographics.requestDetails.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSizes.spaceMd),
                Text(
                  t.infographics.requestDetails.noRequest,
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
                    t.infographics.requestDetails.title,
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
                label: t.infographics.requestDetails.url,
                value: requestDetails.url,
                isUrl: true,
                onCopy: () {
                  Clipboard.setData(ClipboardData(text: requestDetails.url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(t.infographics.requestDetails.urlCopied),
                    ),
                  );
                },
              ),

              const Gap(AppSizes.spaceSm),

              // Parameters
              DetailRow(
                label: t.infographics.requestDetails.parameters,
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
                    '${t.infographics.requestDetails.responseTime}: ${requestDetails.responseTime?.inMilliseconds ?? 0}ms',
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
