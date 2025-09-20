import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/code_snippet_widget.dart';

class NewsCategoriesResultsRequestDetailsPanel extends StatelessWidget {
  const NewsCategoriesResultsRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCategoriesResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCategoriesResultsCubit>();
        final requestDetails = cubit.lastRequestDetails;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
              // Header
              Row(
                children: [
                  Icon(
                    Icons.code,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.newsCategories.requestDetails.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (requestDetails != null) ...[
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceXs,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${requestDetails.responseTime?.inMilliseconds ?? 0}ms',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              if (requestDetails != null) ...[
                const Gap(AppSizes.spaceMd),

                // URL
                _buildDetailItem(
                  context,
                  t.newsCategories.requestDetails.endpoint,
                  requestDetails.url,
                ),

                const Gap(AppSizes.spaceSm),

                // Method
                _buildDetailItem(
                  context,
                  t.newsCategories.requestDetails.method,
                  requestDetails.method,
                ),

                const Gap(AppSizes.spaceSm),

                // Parameters
                Text(
                  t.newsCategories.requestDetails.parameters,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(AppSizes.spaceXs),
                CodeSnippetWidget(
                  code: _buildParametersString(requestDetails.parameters),
                  language: 'json',
                ),

                const Gap(AppSizes.spaceSm),

                // cURL Command
                Text(
                  t.newsCategories.requestDetails.curlExample,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(AppSizes.spaceXs),
                CodeSnippetWidget(
                  code:
                      'curl -X ${requestDetails.method} "${requestDetails.url}"',
                  language: 'bash',
                ),
              ] else ...[
                const Gap(AppSizes.spaceMd),
                Text(
                  t.newsCategories.requestDetails.noRequestYet,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const Gap(AppSizes.spaceXs),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spaceSm,
            vertical: AppSizes.spaceXs,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
          ),
        ),
      ],
    );
  }

  String _buildParametersString(Map<String, dynamic> parameters) {
    final buffer = StringBuffer('{\n');
    parameters.forEach((key, value) {
      buffer.write('  "$key": ');
      if (value is String) {
        buffer.write('"$value"');
      } else {
        buffer.write(value);
      }
      buffer.write(',\n');
    });
    if (buffer.length > 2) {
      final content = buffer.toString().substring(0, buffer.length - 2);
      buffer.clear();
      buffer.write(content);
      buffer.write('\n');
    }
    buffer.write('}');
    return buffer.toString();
  }
}
