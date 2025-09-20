import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/shared/widgets/publication_card.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationsResultsListWidget extends StatelessWidget {
  const PublicationsResultsListWidget({
    required this.publications,
    required this.domain,
    required this.language,
    super.key,
  });

  final List<Publication> publications;
  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Results header
        Row(
          children: [
            Icon(
              Icons.article,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              t.publications.results.title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Gap(AppSizes.spaceSm),

        // Results count
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceSm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            t.publications.results.found.replaceAll(
              '{count}',
              '${publications.length}',
            ),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        // Publications list
        ...publications.asMap().entries.map((entry) {
          final index = entry.key;
          final publication = entry.value;

          return Column(
            children: [
              PublicationCard(
                publication: publication,
                onTap: () {
                  context.router.push(
                    PublicationDetailRoute(
                      publicationId: publication.id,
                      domain: domain,
                      language: language,
                    ),
                  );
                },
              ),
              if (index < publications.length - 1) const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }
}
