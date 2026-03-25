import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/publications/presentation/widgets/related_publications_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationDetailContent extends StatelessWidget {
  const PublicationDetailContent({required this.publication, super.key});

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PublicationHeaderSection(
            publication: publication,
            theme: theme,
            t: t,
          ),
          const Gap(AppSizes.spaceLg),
          _PublicationMetadataSection(
            publication: publication,
            theme: theme,
            t: t,
          ),
          const Gap(AppSizes.spaceLg),
          if (publication.abstract != null && publication.abstract!.isNotEmpty)
            _PublicationAbstractSection(
              publication: publication,
              theme: theme,
              t: t,
            ),
          if (publication.abstract != null && publication.abstract!.isNotEmpty)
            const Gap(AppSizes.spaceLg),
          if (publication.relatedPublications.isNotEmpty)
            RelatedPublicationsWidget(
              relatedPublications: publication.relatedPublications,
            ),
          if (publication.relatedPublications.isNotEmpty)
            const Gap(AppSizes.spaceLg),
          const _PublicationActionButtons(),
        ],
      ),
    );
  }
}

class _PublicationHeaderSection extends StatelessWidget {
  const _PublicationHeaderSection({
    required this.publication,
    required this.theme,
    required this.t,
  });

  final Publication publication;
  final ThemeData theme;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 120,
            height: 160,
            child: Image.network(
              publication.cover,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => ColoredBox(
                    color: theme.colorScheme.surfaceContainerLowest,
                    child: Icon(
                      Icons.book,
                      size: 48,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return ColoredBox(
                  color: theme.colorScheme.surfaceContainerLowest,
                  child: Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Gap(AppSizes.spaceMd),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                publication.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSizes.spaceSm),
              if (publication.issn.isNotEmpty) ...[
                _PublicationInfoRow(
                  label: t.publications.fields.issn,
                  value: publication.issn,
                ),
                const Gap(AppSizes.spaceXs),
              ],
              if (publication.size.isNotEmpty) ...[
                _PublicationInfoRow(
                  label: t.publications.fields.size,
                  value: publication.size,
                ),
                const Gap(AppSizes.spaceXs),
              ],
              if (publication.releaseDate != null)
                _PublicationInfoRow(
                  label: t.publications.fields.releaseDate,
                  value: _formatPublicationDate(publication.releaseDate!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PublicationMetadataSection extends StatelessWidget {
  const _PublicationMetadataSection({
    required this.publication,
    required this.theme,
    required this.t,
  });

  final Publication publication;
  final ThemeData theme;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.publications.fields.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(AppSizes.spaceMd),
            ...{
              if (publication.catalogueNumber != null &&
                  publication.catalogueNumber!.isNotEmpty)
                t.publications.fields.catalogueNumber:
                    publication.catalogueNumber!,
              if (publication.publicationNumber != null &&
                  publication.publicationNumber!.isNotEmpty)
                t.publications.fields.publicationNumber:
                    publication.publicationNumber!,
              if (publication.updateDate != null)
                t.publications.fields.updatedAt: _formatPublicationDate(
                  publication.updateDate!,
                ),
            }.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
                child: _PublicationInfoRow(
                  label: entry.key,
                  value: entry.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PublicationAbstractSection extends StatelessWidget {
  const _PublicationAbstractSection({
    required this.publication,
    required this.theme,
    required this.t,
  });

  final Publication publication;
  final ThemeData theme;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.publications.fields.abstract,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(AppSizes.spaceMd),
            Text(
              publication.abstract!,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class _PublicationActionButtons extends StatelessWidget {
  const _PublicationActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Handle PDF download
              // This would typically launch the URL
            },
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('PDF'),
          ),
        ),
        const Gap(AppSizes.spaceMd),
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              // Handle share functionality
            },
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ),
      ],
    );
  }
}

class _PublicationInfoRow extends StatelessWidget {
  const _PublicationInfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Expanded(child: Text(value, style: theme.textTheme.bodySmall)),
      ],
    );
  }
}

String _formatPublicationDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/'
      '${date.year}';
}
