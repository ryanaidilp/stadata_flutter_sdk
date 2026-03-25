import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_cubit.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/html_text_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

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
            _NewsResultsContent(
              state: state,
              onShowNewsDetails: onShowNewsDetails,
              t: t,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsResultsContent extends StatelessWidget {
  const _NewsResultsContent({
    required this.state,
    required this.onShowNewsDetails,
    required this.t,
    required this.pageController,
  });

  final BaseState state;
  final void Function(BuildContext context, News news) onShowNewsDetails;
  final TranslationsEn t;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final actualState =
        state is NewsState ? (state as NewsState).baseState : state;

    if (actualState is InitialState) {
      return _NewsInitialStateView(t: t);
    }

    if (actualState is LoadingState) {
      return const _NewsLoadingStateView();
    }

    if (actualState is LoadedState<List<News>>) {
      return _NewsLoadedStateView(
        t: t,
        loadedState: actualState,
        onShowNewsDetails: onShowNewsDetails,
        pageController: pageController,
      );
    }

    if (actualState is ErrorState) {
      return _NewsErrorStateView(
        t: t,
        errorState: actualState,
      );
    }

    return _NewsInitialStateView(t: t);
  }
}

class _NewsInitialStateView extends StatelessWidget {
  const _NewsInitialStateView({required this.t});

  final TranslationsEn t;

  @override
  Widget build(BuildContext context) {
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
}

class _NewsLoadingStateView extends StatelessWidget {
  const _NewsLoadingStateView();

  @override
  Widget build(BuildContext context) {
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
}

class _NewsLoadedStateView extends StatelessWidget {
  const _NewsLoadedStateView({
    required this.t,
    required this.loadedState,
    required this.onShowNewsDetails,
    required this.pageController,
  });

  final TranslationsEn t;
  final LoadedState<List<News>> loadedState;
  final void Function(BuildContext context, News news) onShowNewsDetails;
  final TextEditingController? pageController;

  @override
  Widget build(BuildContext context) {
    final newsList = loadedState.data;

    if (newsList.isEmpty) {
      return _NewsEmptyStateView(t: t);
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
            t.news.results.found.replaceAll('{count}', '${newsList.length}'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Gap(AppSizes.spaceMd),
        ...newsList.map(
          (news) => Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.spaceMd),
            child: _NewsCard(
              news: news,
              onShowNewsDetails: onShowNewsDetails,
            ),
          ),
        ),
        if (pageController != null)
          _NewsPaginationControls(pageController: pageController!),
      ],
    );
  }
}

class _NewsEmptyStateView extends StatelessWidget {
  const _NewsEmptyStateView({required this.t});

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
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.news, required this.onShowNewsDetails});

  final News news;
  final void Function(BuildContext context, News news) onShowNewsDetails;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy, HH:mm');

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: () => onShowNewsDetails(context, news),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Padding(
              padding: const EdgeInsets.all(AppSizes.spaceMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                      Text(
                        dateFormat.format(news.releaseDate),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSizes.spaceMd),
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSizes.spaceSm),
                  HtmlTextWidget(
                    data: news.content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSizes.spaceSm),
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
}

class _NewsErrorStateView extends StatelessWidget {
  const _NewsErrorStateView({required this.t, required this.errorState});

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

class _NewsPaginationControls extends StatelessWidget {
  const _NewsPaginationControls({required this.pageController});

  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    try {
      final newsResultsCubit = context.read<NewsResultsCubit>();
      return _NewsResultsPaginationControls(cubit: newsResultsCubit);
    } on Exception catch (_) {
      try {
        final newsCubit = context.read<NewsCubit>();
        return _NewsCubitPaginationControls(
          cubit: newsCubit,
          pageController: pageController,
        );
      } on Exception catch (_) {
        return const SizedBox.shrink();
      }
    }
  }
}

class _NewsResultsPaginationControls extends StatelessWidget {
  const _NewsResultsPaginationControls({required this.cubit});

  final NewsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
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
  }
}

class _NewsCubitPaginationControls extends StatelessWidget {
  const _NewsCubitPaginationControls({
    required this.cubit,
    required this.pageController,
  });

  final NewsCubit cubit;
  final TextEditingController pageController;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

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
          IconButton(
            onPressed: cubit.currentPage > 1 ? cubit.previousPage : null,
            icon: const Icon(Icons.chevron_left),
            tooltip: t.shared.pagination.previousPageTooltip,
          ),
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
