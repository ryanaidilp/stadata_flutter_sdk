import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';

/// A theme-aware container card for a set of API/query parameter fields.
///
/// Renders a bordered, rounded card with an icon + title header followed by
/// [children]. Unlike an ad-hoc `Container` with a hardcoded background,
/// this widget derives its background from
/// `Theme.of(context).colorScheme.surface`, so it stays legible whether the
/// app is running in light or dark theme.
///
/// Typically paired with [ParameterField] for each individual field:
///
/// ```dart
/// ParametersPanel(
///   title: t.myFeature.parameters.title,
///   children: [
///     ParameterField(
///       label: t.myFeature.parameters.domain,
///       child: TextFormField(controller: domainController),
///     ),
///   ],
/// )
/// ```
class ParametersPanel extends StatelessWidget {
  const ParametersPanel({
    required this.title,
    required this.children,
    super.key,
    this.icon = Icons.settings,
  });

  /// The panel header title, shown next to [icon].
  final String title;

  /// The icon shown before [title] in the header row.
  final IconData icon;

  /// The panel body, typically a list of [ParameterField]s and spacing.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: theme.colorScheme.primary),
              const Gap(AppSizes.spaceXs),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          ...children,
        ],
      ),
    );
  }
}

/// A labeled wrapper for a single parameter field inside a [ParametersPanel].
///
/// Renders [label] above [child] (typically a [TextFormField] or
/// [DropdownButtonFormField]) using an explicit
/// `colorScheme.onSurface`-derived color, rather than relying on whatever
/// color the ambient `labelMedium` text style happens to resolve to.
class ParameterField extends StatelessWidget {
  const ParameterField({required this.label, required this.child, super.key});

  /// The field label, shown above [child].
  final String label;

  /// The form field (or group of widgets) this label describes.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const Gap(AppSizes.spaceXs),
        child,
      ],
    );
  }
}
