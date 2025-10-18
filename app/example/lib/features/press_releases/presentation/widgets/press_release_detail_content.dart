import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleaseDetailContent extends StatelessWidget {
  const PressReleaseDetailContent({required this.pressRelease, super.key});

  final PressRelease pressRelease;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cover Image
          if (pressRelease.cover.isNotEmpty) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                pressRelease.cover,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 200,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      child: Icon(
                        Icons.article,
                        size: 64,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
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
            const Gap(AppSizes.spaceLg),
          ],

          // Title
          Text(
            pressRelease.title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(AppSizes.spaceMd),

          // Metadata Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Release Date
                  _buildInfoRow(
                    context,
                    icon: Icons.calendar_today,
                    label: t.pressReleases.fields.releaseDate,
                    value: _formatDate(pressRelease.releaseDate),
                  ),
                  if (pressRelease.size.isNotEmpty) ...[
                    const Gap(AppSizes.spaceSm),
                    _buildInfoRow(
                      context,
                      icon: Icons.file_download,
                      label: t.pressReleases.fields.size,
                      value: pressRelease.size,
                    ),
                  ],
                ],
              ),
            ),
          ),
          const Gap(AppSizes.spaceLg),

          // Abstract Section
          if (pressRelease.abstract != null &&
              pressRelease.abstract!.isNotEmpty) ...[
            Text(
              t.pressReleases.fields.abstract,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const Gap(AppSizes.spaceSm),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: HtmlTextWidget(
                data: pressRelease.abstract!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Gap(AppSizes.spaceLg),
          ],

          // Download Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement PDF download
              },
              icon: const Icon(Icons.picture_as_pdf),
              label: Text(t.pressReleases.actions.downloadPdf),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const Gap(AppSizes.spaceSm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}
