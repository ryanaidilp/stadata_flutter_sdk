import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/shared/widgets/subject_category_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectCategoriesResultsListWidget extends StatelessWidget {
  const SubjectCategoriesResultsListWidget({
    required this.subjectCategories,
    required this.domain,
    required this.language,
    super.key,
  });

  final List<SubjectCategory> subjectCategories;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final count = subjectCategories.length;
    final plural =
        count == 1
            ? t.subjectCategories.results.foundSingular
            : t.subjectCategories.results.foundPlural;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.category,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              t.subjectCategories.results.title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Gap(AppSizes.spaceSm),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceSm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            t.subjectCategories.results.found
                .replaceAll('{count}', count.toString())
                .replaceAll('{plural}', plural),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        ...subjectCategories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;

          return Column(
            children: [
              SubjectCategoryCard(subjectCategory: category),
              if (index < subjectCategories.length - 1)
                const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }
}
