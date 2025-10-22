import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/shared/widgets/subject_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectsResultsListWidget extends StatelessWidget {
  const SubjectsResultsListWidget({
    required this.subjects,
    required this.domain,
    required this.language,
    super.key,
  });

  final List<Subject> subjects;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.subject,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              'Subjects Results',
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
            'Found ${subjects.length} subject(s)',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        ...subjects.asMap().entries.map((entry) {
          final index = entry.key;
          final subject = entry.value;

          return Column(
            children: [
              SubjectCard(subject: subject),
              if (index < subjects.length - 1) const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }
}
