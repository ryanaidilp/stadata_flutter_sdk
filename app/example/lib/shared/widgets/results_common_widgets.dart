import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';

class ResultsParametersPanel extends StatelessWidget {
  const ResultsParametersPanel({
    required this.title,
    required this.chips,
    super.key,
    this.icon = Icons.search,
    this.padding = const EdgeInsets.all(AppSizes.spaceMd),
    this.margin,
    this.backgroundColor,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.headerBottomSpacing = AppSizes.spaceMd,
    this.chipSpacing = AppSizes.spaceSm,
    this.chipRunSpacing = AppSizes.spaceXs,
    this.titleStyle,
  });

  final String title;
  final IconData? icon;
  final List<Widget> chips;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry borderRadius;
  final double headerBottomSpacing;
  final double chipSpacing;
  final double chipRunSpacing;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius,
        border:
            border ??
            Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: theme.colorScheme.primary),
                const Gap(AppSizes.spaceXs),
              ],
              Text(
                title,
                style:
                    titleStyle ??
                    theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          Gap(headerBottomSpacing),
          Wrap(
            spacing: chipSpacing,
            runSpacing: chipRunSpacing,
            children: chips,
          ),
        ],
      ),
    );
  }
}

class ResultsParameterChip extends StatelessWidget {
  const ResultsParameterChip({
    required this.text,
    super.key,
    this.icon,
    this.backgroundColor,
    this.labelStyle,
    this.visualDensity,
  });

  final IconData? icon;
  final String text;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null ? Icon(icon, size: 16) : null,
      label: Text(text),
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      labelStyle: labelStyle,
      visualDensity: visualDensity,
    );
  }
}

class ResultsEmptyState extends StatelessWidget {
  const ResultsEmptyState({
    required this.message,
    super.key,
    this.icon = Icons.inbox_outlined,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: theme.colorScheme.outline),
          const Gap(AppSizes.spaceMd),
          Text(
            message,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
