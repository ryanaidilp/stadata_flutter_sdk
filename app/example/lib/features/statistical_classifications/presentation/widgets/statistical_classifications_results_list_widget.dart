import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/shared/widgets/statistical_classification_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticalClassificationsResultsListWidget extends StatelessWidget {
  const StatisticalClassificationsResultsListWidget({
    required this.classifications,
    super.key,
  });

  final List<StatisticClassification> classifications;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final count = classifications.length;
    final plural =
        count == 1
            ? t.statisticalClassifications.results.foundSingular
            : t.statisticalClassifications.results.foundPlural;

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
              t.statisticalClassifications.results.title,
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
            t.statisticalClassifications.results.found
                .replaceAll('{count}', count.toString())
                .replaceAll('{plural}', plural),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        ...classifications.asMap().entries.map((entry) {
          final index = entry.key;
          final classification = entry.value;

          return Column(
            children: [
              StatisticalClassificationCard(
                statisticalClassification: classification,
              ),
              if (index < classifications.length - 1)
                const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }
}
