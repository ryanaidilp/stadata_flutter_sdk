import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_topics/presentation/widgets/census_topic_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusTopicsResultsListWidget extends StatelessWidget {
  const CensusTopicsResultsListWidget({required this.censusTopics, super.key});

  final List<CensusTopic> censusTopics;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    if (censusTopics.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.topic_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const Gap(AppSizes.spaceMd),
            Text(
              t.common.noData,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.censusTopics.results.found(n: censusTopics.length),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(AppSizes.spaceMd),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: censusTopics.length,
          separatorBuilder: (context, index) => const Gap(AppSizes.spaceMd),
          itemBuilder: (context, index) {
            final topic = censusTopics[index];
            return CensusTopicCard(censusTopic: topic);
          },
        ),
      ],
    );
  }
}
