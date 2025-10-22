import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class VariableCard extends StatelessWidget {
  const VariableCard({required this.variable, super.key});

  final Variable variable;

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
            // Title header
            Row(
              children: [
                Icon(
                  Icons.bar_chart,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const Gap(AppSizes.spaceXs),
                Expanded(
                  child: Text(
                    variable.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceSm),

            // ID and vertical variable ID
            Row(
              children: [
                Expanded(
                  child: _buildDetailRow(
                    context,
                    label: t.variables.fields.id,
                    value: variable.id.toString(),
                    icon: Icons.tag,
                  ),
                ),
                const Gap(AppSizes.spaceSm),
                Expanded(
                  child: _buildDetailRow(
                    context,
                    label: t.variables.fields.verticalVariableID,
                    value: variable.verticalVariableID.toString(),
                    icon: Icons.vertical_distribute,
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceXs),

            // Graph name
            _buildDetailRow(
              context,
              label: t.variables.fields.graphName,
              value: variable.graphName,
              icon: Icons.show_chart,
            ),
            const Gap(AppSizes.spaceXs),

            // Unit
            _buildDetailRow(
              context,
              label: t.variables.fields.unit,
              value: variable.unit,
              icon: Icons.straighten,
            ),
            const Gap(AppSizes.spaceXs),

            // Subject
            Row(
              children: [
                Expanded(
                  child: _buildDetailRow(
                    context,
                    label: t.variables.fields.subjectID,
                    value: variable.subjectID.toString(),
                    icon: Icons.category,
                  ),
                ),
                const Gap(AppSizes.spaceSm),
                Expanded(
                  flex: 2,
                  child: _buildDetailRow(
                    context,
                    label: t.variables.fields.subjectName,
                    value: variable.subjectName,
                    icon: Icons.label,
                  ),
                ),
              ],
            ),

            // Notes (expandable)
            if (variable.notes.isNotEmpty) ...[
              const Gap(AppSizes.spaceSm),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(
                  left: AppSizes.spaceSm,
                  bottom: AppSizes.spaceXs,
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      t.variables.fields.notes,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                children: [
                  Text(
                    variable.notes,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
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
