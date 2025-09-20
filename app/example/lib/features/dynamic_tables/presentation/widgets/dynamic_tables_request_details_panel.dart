import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_tables_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

class DynamicTablesRequestDetailsPanel extends StatelessWidget {
  const DynamicTablesRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DynamicTablesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesCubit>();
        final requestDetails = cubit.lastRequestDetails;

        if (requestDetails == null) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.spaceMd),
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.code,
                    color: theme.colorScheme.primary,
                    size: AppSizes.iconMd,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Request Details',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
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
                      requestDetails.method,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // URL
              _buildDetailSection(
                context,
                'Request URL',
                requestDetails.url,
                Icons.link,
              ),

              const Gap(AppSizes.spaceSm),

              // Parameters
              _buildDetailSection(
                context,
                'Parameters',
                requestDetails.parameters.entries
                    .map((e) => '${e.key}: ${e.value}')
                    .join('\n'),
                Icons.settings,
              ),

              const Gap(AppSizes.spaceSm),

              // Response Time
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: AppSizes.iconSm,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Response Time: ${requestDetails.responseTime?.inMilliseconds ?? 0}ms',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
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

  Widget _buildDetailSection(
    BuildContext context,
    String title,
    String content,
    IconData icon,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: AppSizes.iconSm,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Gap(AppSizes.spaceXs),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceSm),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: SelectableText(
            content,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
