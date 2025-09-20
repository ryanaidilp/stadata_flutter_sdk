import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
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
          // Publication header with cover and basic info
          _buildPublicationHeader(context, theme, t),

          const Gap(AppSizes.spaceLg),

          // Publication metadata
          _buildMetadataSection(context, theme, t),

          const Gap(AppSizes.spaceLg),

          // Abstract section
          if (publication.abstract != null && publication.abstract!.isNotEmpty)
            _buildAbstractSection(context, theme, t),

          const Gap(AppSizes.spaceLg),

          // Action buttons
          _buildActionButtons(context, theme, t),
        ],
      ),
    );
  }

  Widget _buildPublicationHeader(
    BuildContext context,
    ThemeData theme,
    Translations t,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 120,
            height: 160,
            child: Image.network(
              publication.cover,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    color: theme.colorScheme.surfaceContainerLowest,
                    child: Icon(
                      Icons.book,
                      size: 48,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
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

        // Publication info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                publication.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Gap(AppSizes.spaceSm),

              // Basic info
              if (publication.issn.isNotEmpty) ...[
                _buildInfoRow(
                  context,
                  t.publications.fields.issn,
                  publication.issn,
                ),
                const Gap(AppSizes.spaceXs),
              ],

              if (publication.size.isNotEmpty) ...[
                _buildInfoRow(
                  context,
                  t.publications.fields.size,
                  publication.size,
                ),
                const Gap(AppSizes.spaceXs),
              ],

              if (publication.releaseDate != null) ...[
                _buildInfoRow(
                  context,
                  t.publications.fields.releaseDate,
                  _formatDate(publication.releaseDate!),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetadataSection(
    BuildContext context,
    ThemeData theme,
    Translations t,
  ) {
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

            // Metadata grid
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
                t.publications.fields.updatedAt: _formatDate(
                  publication.updateDate!,
                ),
            }.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
                child: _buildInfoRow(context, entry.key, entry.value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbstractSection(
    BuildContext context,
    ThemeData theme,
    Translations t,
  ) {
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

  Widget _buildActionButtons(
    BuildContext context,
    ThemeData theme,
    Translations t,
  ) {
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

  Widget _buildInfoRow(BuildContext context, String label, String value) {
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
