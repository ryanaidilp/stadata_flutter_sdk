import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusAreaCard extends StatelessWidget {
  const CensusAreaCard({required this.area, super.key});

  final CensusArea area;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Area name header
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const Gap(AppSizes.spaceXs),
                Expanded(
                  child: Text(
                    area.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceSm),

            // Details
            _buildDetailRow(
              context,
              label: t.censusAreas.fields.id,
              value: area.id.toString(),
              icon: Icons.tag,
            ),
            const Gap(AppSizes.spaceXs),
            _buildDetailRow(
              context,
              label: t.censusAreas.fields.slug,
              value: area.slug,
              icon: Icons.link,
            ),
            const Gap(AppSizes.spaceXs),
            _buildDetailRow(
              context,
              label: t.censusAreas.fields.mfdCode,
              value: area.mfdCode,
              icon: Icons.qr_code,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
        const Gap(AppSizes.spaceXs),
        Text(
          '$label: ',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
