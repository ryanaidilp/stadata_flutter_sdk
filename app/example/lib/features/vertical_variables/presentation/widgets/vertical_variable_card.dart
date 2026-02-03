import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class VerticalVariableCard extends StatelessWidget {
  const VerticalVariableCard({required this.verticalVariable, super.key});

  final VerticalVariable verticalVariable;

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
                  Icons.vertical_distribute,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const Gap(AppSizes.spaceXs),
                Expanded(
                  child: Text(
                    verticalVariable.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceSm),

            // ID and Item ID
            Row(
              children: [
                Expanded(
                  child: _buildDetailRow(
                    context,
                    label: 'ID',
                    value: verticalVariable.id.toString(),
                    icon: Icons.tag,
                  ),
                ),
                const Gap(AppSizes.spaceSm),
                Expanded(
                  child: _buildDetailRow(
                    context,
                    label: 'Item ID',
                    value: verticalVariable.itemID.toString(),
                    icon: Icons.inventory_2,
                  ),
                ),
              ],
            ),

            // Group ID and Group Name (optional fields)
            if (verticalVariable.groupID != null ||
                verticalVariable.groupName != null) ...[
              const Gap(AppSizes.spaceXs),
              Row(
                children: [
                  if (verticalVariable.groupID != null)
                    Expanded(
                      child: _buildDetailRow(
                        context,
                        label: 'Group ID',
                        value: verticalVariable.groupID.toString(),
                        icon: Icons.group_work,
                      ),
                    ),
                  if (verticalVariable.groupID != null &&
                      verticalVariable.groupName != null)
                    const Gap(AppSizes.spaceSm),
                  if (verticalVariable.groupName != null)
                    Expanded(
                      flex: 2,
                      child: _buildDetailRow(
                        context,
                        label: 'Group Name',
                        value: verticalVariable.groupName!,
                        icon: Icons.label,
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
