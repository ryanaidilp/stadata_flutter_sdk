import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DerivedPeriodCard extends StatelessWidget {
  const DerivedPeriodCard({required this.derivedPeriod, super.key});

  final DerivedPeriod derivedPeriod;

  @override
  Widget build(BuildContext context) {
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
            // Title header
            Row(
              children: [
                Icon(
                  Icons.event_repeat,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const Gap(AppSizes.spaceXs),
                Expanded(
                  child: Text(
                    derivedPeriod.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceSm),

            // ID
            _DerivedPeriodDetailRow(
              label: 'ID',
              value: derivedPeriod.id.toString(),
              icon: Icons.tag,
            ),
            const Gap(AppSizes.spaceXs),

            // Group ID
            _DerivedPeriodDetailRow(
              label: 'Group ID',
              value: derivedPeriod.groupID.toString(),
              icon: Icons.group_work,
            ),
            const Gap(AppSizes.spaceXs),

            // Group Name
            _DerivedPeriodDetailRow(
              label: 'Group Name',
              value: derivedPeriod.groupName,
              icon: Icons.category,
            ),
          ],
        ),
      ),
    );
  }
}

class _DerivedPeriodDetailRow extends StatelessWidget {
  const _DerivedPeriodDetailRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
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
