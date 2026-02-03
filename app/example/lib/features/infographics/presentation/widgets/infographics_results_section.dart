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

            _buildResultsContent(context, t),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsContent(BuildContext context, TranslationsEn t) {
    return switch (state) {
      InitialState() => _buildInitialState(context, t),
      LoadingState() => _buildLoadingState(context, t),
      LoadedState<List<Infographic>>() => _buildLoadedState(
        context,
        t,
        state as LoadedState<List<Infographic>>,
      ),
      ErrorState() => _buildErrorState(context, t, state as ErrorState),
      _ => _buildInitialState(context, t),
    };
  }

  Widget _buildInitialState(BuildContext context, TranslationsEn t) {
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

  Widget _buildLoadingState(BuildContext context, TranslationsEn t) {
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

  Widget _buildLoadedState(
    BuildContext context,
    TranslationsEn t,
    LoadedState<List<Infographic>> loadedState,
  ) {
    final infographics = loadedState.data;

    if (infographics.isEmpty) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Results count
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

        // Infographics grid
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
            return _buildInfographicCard(context, infographic);
          },
        ),

        const Gap(AppSizes.spaceMd),

        // Pagination controls (if pageController is provided)
        if (pageController != null) _buildPaginationControls(context),
      ],
    );
  }

  Widget _buildInfographicCard(BuildContext context, Infographic infographic) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onShowInfographicDetails(context, infographic),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
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

            // Content
            Container(
              height: 80, // Fixed height to prevent overflow
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

  Widget _buildErrorState(
    BuildContext context,
    TranslationsEn t,
    ErrorState errorState,
  ) {
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

  Widget _buildPaginationControls(BuildContext context) {
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
          cubit.setPage(index + 1);
          cubit.loadData();
        },
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }
}
