import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/infographics/presentation/cubit/infographics_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A widget that displays infographics results in a structured format for the results page
class InfographicsResultsSection extends StatelessWidget {
  const InfographicsResultsSection({
    required this.state,
    required this.onShowInfographicDetails,
    this.pageController,
    super.key,
  });

  final BaseState state;
  final void Function(BuildContext context, Infographic infographic)
  onShowInfographicDetails;
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
                  Icons.photo_library,
                  size: AppSizes.iconSm,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  t.infographics.results.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Gap(AppSizes.spaceMd),
            _InfographicsResultsContent(
              state: state,
              t: t,
              onShowInfographicDetails: onShowInfographicDetails,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfographicsResultsContent extends StatelessWidget {
  const _InfographicsResultsContent({
    required this.state,
    required this.t,
    required this.onShowInfographicDetails,
    required this.pageController,
  });

  final BaseState state;
  final TranslationsEn t;
  final void Function(BuildContext context, Infographic infographic)
  onShowInfographicDetails;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      InitialState() => _InfographicsInitialStateView(t: t),
      LoadingState() => const _InfographicsLoadingStateView(),
      LoadedState<List<Infographic>>() => _InfographicsLoadedStateView(
        t: t,
        loadedState: state as LoadedState<List<Infographic>>,
        onShowInfographicDetails: onShowInfographicDetails,
        pageController: pageController,
      ),
      ErrorState() => _InfographicsErrorStateView(
        t: t,
        errorState: state as ErrorState,
      ),
      _ => _InfographicsInitialStateView(t: t),
    };
  }
}

class _InfographicsInitialStateView extends StatelessWidget {
  const _InfographicsInitialStateView({required this.t});

  final TranslationsEn t;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const Gap(AppSizes.spaceMd),
          Text(
            t.infographics.results.initial,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InfographicsLoadingStateView extends StatelessWidget {
  const _InfographicsLoadingStateView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Gap(AppSizes.spaceMd),
          Text('Loading infographics...'),
        ],
      ),
    );
  }
}

class _InfographicsLoadedStateView extends StatelessWidget {
  const _InfographicsLoadedStateView({
    required this.t,
    required this.loadedState,
    required this.onShowInfographicDetails,
    required this.pageController,
  });

  final TranslationsEn t;
  final LoadedState<List<Infographic>> loadedState;
  final void Function(BuildContext context, Infographic infographic)
  onShowInfographicDetails;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final infographics = loadedState.data;

    if (infographics.isEmpty) {
      return _InfographicsEmptyStateView(t: t);
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
            t.infographics.results.found.replaceAll(
              '{count}',
              '${infographics.length}',
            ),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(AppSizes.spaceMd),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSizes.spaceMd,
            mainAxisSpacing: AppSizes.spaceMd,
            childAspectRatio: 0.75,
          ),
          itemCount: infographics.length,
          itemBuilder: (context, index) {
            final infographic = infographics[index];
            return _InfographicCard(
              infographic: infographic,
              onShowInfographicDetails: onShowInfographicDetails,
            );
          },
        ),
        const Gap(AppSizes.spaceMd),
        if (pageController != null)
          _InfographicsPaginationControls(pageController: pageController!),
      ],
    );
  }
}

class _InfographicsEmptyStateView extends StatelessWidget {
  const _InfographicsEmptyStateView({required this.t});

  final TranslationsEn t;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const Gap(AppSizes.spaceMd),
          Text(
            t.infographics.results.empty,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InfographicCard extends StatelessWidget {
  const _InfographicCard({
    required this.infographic,
    required this.onShowInfographicDetails,
  });

  final Infographic infographic;
  final void Function(BuildContext context, Infographic infographic)
  onShowInfographicDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onShowInfographicDetails(context, infographic),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child:
                    infographic.image.isNotEmpty
                        ? Image.network(
                          infographic.image,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Center(
                                child: Icon(
                                  Icons.broken_image,
                                  size: 32,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            );
                          },
                        )
                        : Center(
                          child: Icon(
                            Icons.photo,
                            size: 32,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.spaceSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    infographic.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: ${infographic.id}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (infographic.description != null) ...[
                    const SizedBox(height: 4),
                    Expanded(
                      child: HtmlTextWidget(
                        data: infographic.description!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfographicsErrorStateView extends StatelessWidget {
  const _InfographicsErrorStateView({
    required this.t,
    required this.errorState,
  });

  final TranslationsEn t;
  final ErrorState errorState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const Gap(AppSizes.spaceMd),
          Text(
            t.common.error,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            errorState.message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _InfographicsPaginationControls extends StatelessWidget {
  const _InfographicsPaginationControls({required this.pageController});

  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    try {
      final cubit = context.read<InfographicsResultsCubit>();
      if (cubit.totalPages <= 1) {
        return const SizedBox.shrink();
      }

      return NumberPaginator(
        key: ValueKey(cubit.currentPage),
        numberPages: cubit.totalPages,
        initialPage: cubit.currentPage - 1,
        onPageChange: (index) {
          cubit.page = index + 1;
          unawaited(cubit.loadData());
        },
      );
    } on Exception catch (_) {
      return const SizedBox.shrink();
    }
  }
}
