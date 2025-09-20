import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_cubit.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:intl/intl.dart';

/// A widget that displays news results in a structured format
class NewsResultsSection extends StatelessWidget {
  const NewsResultsSection({
    required this.state,
    required this.onShowNewsDetails,
    this.pageController,
    super.key,
  });

  final BaseState state;
  final void Function(BuildContext context, News news) onShowNewsDetails;
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
                  Icons.article,
                  size: AppSizes.iconSm,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Gap(AppSizes.spaceXs),
                Text(
                  t.news.results.title,
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
    // Extract the actual state from NewsState wrapper if present
    final actualState =
        state is NewsState ? (state as NewsState).baseState : state;

    return switch (actualState) {
      InitialState() => _buildInitialState(context, t),
      LoadingState() => _buildLoadingState(context, t),
      LoadedState<List<News>>() => _buildLoadedState(context, t, actualState),
      ErrorState() => _buildErrorState(context, t, actualState),
      _ => _buildInitialState(context, t),
    };
  }

  Widget _buildInitialState(BuildContext context, TranslationsEn t) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const Gap(AppSizes.spaceMd),
          Text(
            t.news.results.initial,
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
          Text('Loading news...'),
        ],
      ),
    );
  }

  Widget _buildLoadedState(
    BuildContext context,
    TranslationsEn t,
    LoadedState<List<News>> loadedState,
  ) {
    final newsList = loadedState.data;

    if (newsList.isEmpty) {
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
              t.news.results.empty,
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
            t.news.results.found.replaceAll('{count}', '${newsList.length}'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(AppSizes.spaceMd),

        // News list
        ...newsList.map(
          (news) => Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.spaceMd),
            child: _buildNewsCard(context, news),
          ),
        ),

        // Pagination controls (if pageController is provided)
        if (pageController != null) _buildPaginationControls(context),
      ],
    );
  }

  Widget _buildNewsCard(BuildContext context, News news) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: () => onShowNewsDetails(context, news),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            if (news.picture.isNotEmpty)
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  news.picture,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        height: 200,
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                        child: Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 32,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 200,
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      ),
                    );
                  },
                ),
              ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category and Date
                  Row(
                    children: [
                      // Category Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceXs,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          news.category,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Date
                      Text(
                        dateFormat.format(news.releaseDate),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSizes.spaceMd),

                  // Title
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSizes.spaceSm),

                  // Content Preview
                  HtmlTextWidget(
                    data: news.content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSizes.spaceSm),

                  // Read more indicator
                  Row(
                    children: [
                      Text(
                        'ID: ${news.id}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Tap to read more',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(AppSizes.spaceXs),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
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
    // Try to get NewsResultsCubit first, fallback to NewsCubit
    try {
      final newsResultsCubit = context.read<NewsResultsCubit>();
      return _buildResultsPaginationControls(context, newsResultsCubit);
    } catch (e) {
      try {
        final newsCubit = context.read<NewsCubit>();
        return _buildNewsPaginationControls(context, newsCubit);
      } catch (e) {
        return const SizedBox.shrink();
      }
    }
  }

  Widget _buildResultsPaginationControls(
    BuildContext context,
    NewsResultsCubit cubit,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceMd,
        vertical: AppSizes.spaceSm,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Previous button
          IconButton(
            onPressed: cubit.currentPage > 1 ? cubit.previousPage : null,
            icon: const Icon(Icons.chevron_left),
            tooltip: t.shared.pagination.previousPageTooltip,
          ),

          // Page input
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Page '),
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: pageController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceXs,
                        vertical: AppSizes.spaceXs,
                      ),
                    ),
                    onSubmitted: (value) {
                      final page = int.tryParse(value);
                      if (page != null && page > 0) {
                        cubit.setPage(page);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Next button
          IconButton(
            onPressed: cubit.nextPage,
            icon: const Icon(Icons.chevron_right),
            tooltip: t.shared.pagination.nextPageTooltip,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsPaginationControls(BuildContext context, NewsCubit cubit) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.spaceMd,
        vertical: AppSizes.spaceSm,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Previous button
          IconButton(
            onPressed: cubit.currentPage > 1 ? cubit.previousPage : null,
            icon: const Icon(Icons.chevron_left),
            tooltip: t.shared.pagination.previousPageTooltip,
          ),

          // Page input
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Page '),
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: pageController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceXs,
                        vertical: AppSizes.spaceXs,
                      ),
                    ),
                    onSubmitted: (value) {
                      final page = int.tryParse(value);
                      if (page != null && page > 0) {
                        cubit.setPage(page);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Next button
          IconButton(
            onPressed: cubit.nextPage,
            icon: const Icon(Icons.chevron_right),
            tooltip: t.shared.pagination.nextPageTooltip,
          ),
        ],
      ),
    );
  }
}
