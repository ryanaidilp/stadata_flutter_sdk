import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/code_snippet_widget.dart';

class NewsCategoriesRequestDetailsPanel extends StatelessWidget {
  const NewsCategoriesRequestDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return BlocBuilder<NewsCategoriesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCategoriesCubit>();

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
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // API Endpoint
              _buildDetailItem(
                context,
                t.newsCategories.requestDetails.endpoint,
                'https://webapi.bps.go.id/v1/api/list/newscategory',
              ),

              const Gap(AppSizes.spaceSm),

              // Method
              _buildDetailItem(
                context,
                t.newsCategories.requestDetails.method,
                'GET',
              ),

              const Gap(AppSizes.spaceSm),

              // Parameters
              Text(
                t.newsCategories.requestDetails.parameters,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              CodeSnippetWidget(
                code: _buildParametersString(cubit),
                language: 'json',
              ),

              const Gap(AppSizes.spaceSm),

              // Example cURL
              Text(
                t.newsCategories.requestDetails.curlExample,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Gap(AppSizes.spaceXs),
              CodeSnippetWidget(
                code: _buildCurlCommand(cubit),
                language: 'bash',
              ),
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

  String _buildParametersString(NewsCategoriesCubit cubit) {
    final params = <String, dynamic>{
      'domain': cubit.currentDomain.isNotEmpty ? cubit.currentDomain : '7200',
      'lang': cubit.currentLanguage.value,
      'key': 'YOUR_API_KEY',
    };

    final buffer = StringBuffer('{\n');
    params.forEach((key, value) {
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

  String _buildCurlCommand(NewsCategoriesCubit cubit) {
    final domain =
        cubit.currentDomain.isNotEmpty ? cubit.currentDomain : '7200';
    final lang = cubit.currentLanguage.value;

    return '''curl -X GET "https://webapi.bps.go.id/v1/api/list/newscategory?domain=$domain&lang=$lang&key=YOUR_API_KEY"''';
  }
}
