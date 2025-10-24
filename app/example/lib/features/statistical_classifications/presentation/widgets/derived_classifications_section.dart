import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DerivedClassificationsSection extends StatelessWidget {
  const DerivedClassificationsSection({
    required this.derived,
    super.key,
  });

  final List<ClassificationItem> derived;

  @override
  Widget build(BuildContext context) {
    if (derived.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final t = LocaleSettings.instance.currentTranslations;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        side: BorderSide(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: ExpansionTile(
        leading: Icon(
          Icons.account_tree_outlined,
          color: theme.colorScheme.primary,
        ),
        title: Text(
          t.statisticalClassifications.detail.derivedClassifications,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${derived.length} ${derived.length == 1 ? 'item' : 'items'}',
          style: theme.textTheme.bodySmall,
        ),
        children: [
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            itemCount: derived.length,
            separatorBuilder: (context, index) => const Gap(AppSizes.spaceSm),
            itemBuilder: (context, index) {
              final item = derived[index];
              return _DerivedClassificationItem(item: item);
            },
          ),
        ],
      ),
    );
  }
}

class _DerivedClassificationItem extends StatelessWidget {
  const _DerivedClassificationItem({
    required this.item,
  });

  final ClassificationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSizes.spaceSm),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceXs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                ),
                child: Text(
                  item.code,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const Gap(AppSizes.spaceXs),
              Expanded(
                child: Text(
                  item.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (item.description.isNotEmpty) ...[
            const Gap(AppSizes.spaceXs),
            Text(
              item.description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
