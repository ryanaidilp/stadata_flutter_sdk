import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/sdg_indicators/presentation/cubit/sdg_indicators_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SdgIndicatorsResultsSection extends StatelessWidget {
  const SdgIndicatorsResultsSection({
    required this.state,
    super.key,
    this.pageController,
  });

  final BaseState state;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Card(
      margin: const EdgeInsets.all(AppSizes.spaceMd),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.public,
                  size: AppSizes.iconSm,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  t.sdgIndicators.results.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceMd),
            _SdgResultsContent(
              state: state,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class _SdgResultsContent extends StatelessWidget {
  const _SdgResultsContent({
    required this.state,
    required this.pageController,
  });

  final BaseState state;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => _EmptyMessage(message: t.sdgIndicators.results.initial),
      LoadingState() => const Center(child: CircularProgressIndicator()),
      final LoadedState<List<SdgIndicator>> loaded => _SdgLoadedView(
        items: loaded.data,
        pageController: pageController,
      ),
      final ErrorState error => _ErrorMessage(message: error.message),
      _ => _EmptyMessage(message: t.sdgIndicators.results.initial),
    };
  }
}

class _SdgLoadedView extends StatelessWidget {
  const _SdgLoadedView({required this.items, required this.pageController});

  final List<SdgIndicator> items;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    if (items.isEmpty) {
      return _EmptyMessage(message: t.sdgIndicators.results.empty);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.spaceMd,
            vertical: AppSizes.spaceSm,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            t.sdgIndicators.results.found.replaceAll(
              '{count}',
              '${items.length}',
            ),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(AppSizes.spaceMd),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.spaceMd),
            child: _SdgIndicatorCard(indicator: item),
          ),
        ),
        if (pageController != null) _PaginationControls(),
      ],
    );
  }
}

class _SdgIndicatorCard extends StatelessWidget {
  const _SdgIndicatorCard({required this.indicator});

  final SdgIndicator indicator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              indicator.title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(AppSizes.spaceSm),
            Wrap(
              spacing: AppSizes.spaceXs,
              runSpacing: AppSizes.spaceXs,
              children: [
                Chip(
                  label: Text(
                    indicator.sdgsId,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: Text(
                    indicator.unit,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              indicator.goalName,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaginationControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SdgIndicatorsResultsCubit>();

    if (cubit.totalPages <= 1) return const SizedBox.shrink();

    return NumberPaginator(
      key: ValueKey(cubit.currentPage),
      numberPages: cubit.totalPages,
      initialPage: cubit.currentPage - 1,
      onPageChange: (index) {
        cubit.page = index + 1;
        unawaited(cubit.loadData());
      },
    );
  }
}

class _EmptyMessage extends StatelessWidget {
  const _EmptyMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceLg),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spaceLg),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const Gap(AppSizes.spaceSm),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
