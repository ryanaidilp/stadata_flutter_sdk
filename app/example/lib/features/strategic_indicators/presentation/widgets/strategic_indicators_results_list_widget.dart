import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/shared/widgets/strategic_indicator_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StrategicIndicatorsResultsListWidget extends StatelessWidget {
  const StrategicIndicatorsResultsListWidget({
    required this.strategicIndicators,
    required this.domain,
    required this.language,
    super.key,
  });

  final List<StrategicIndicator> strategicIndicators;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final count = strategicIndicators.length;
    final plural =
        count == 1
            ? t.strategicIndicators.results.foundSingular
            : t.strategicIndicators.results.foundPlural;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.trending_up,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              t.strategicIndicators.results.title,
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
            t.strategicIndicators.results.found
                .replaceAll('{count}', count.toString())
                .replaceAll('{plural}', plural),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        ...strategicIndicators.asMap().entries.map((entry) {
          final index = entry.key;
          final indicator = entry.value;

          return Column(
            children: [
              StrategicIndicatorCard(strategicIndicator: indicator),
              if (index < strategicIndicators.length - 1)
                const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }
}
