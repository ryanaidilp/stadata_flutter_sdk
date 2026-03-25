import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class NewsResultsPage extends StatelessWidget {
  const NewsResultsPage({
    required this.domain,
    required this.language,
    super.key,
    this.keyword,
    this.newsCategoryID,
    this.month,
    this.year,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;
  final String? newsCategoryID;
  final int? month;
  final int? year;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<NewsResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                newsCategoryID: newsCategoryID,
                month: month,
                year: year,
              ),
      child: const NewsResultsView(),
    );
  }
}

class NewsResultsView extends StatefulWidget {
  const NewsResultsView({super.key});

  @override
  State<NewsResultsView> createState() => _NewsResultsViewState();
}

class _NewsResultsViewState extends State<NewsResultsView> {
  final TextEditingController _pageController = TextEditingController(
    text: '1',
  );

  @override
  void initState() {
    super.initState();

    // Listen to cubit changes to update page controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<NewsResultsCubit>();
      _pageController.text = cubit.currentPage.toString();

      // Update page controller when cubit page changes
      _pageController.addListener(() {
        if (_pageController.text != cubit.currentPage.toString()) {
          _pageController.text = cubit.currentPage.toString();
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.news.results.title),
        actions: [
          // Language display
          BlocBuilder<NewsResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<NewsResultsCubit>();
              return Chip(
                avatar: const Icon(Icons.language, size: 16),
                label: Text(
                  cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                ),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              );
            },
          ),
          const Gap(AppSizes.spaceXs),
          // Alice button
          const AliceButton(),
          // Refresh button
          BlocBuilder<NewsResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          unawaited(context.read<NewsResultsCubit>().refresh());
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: BlocListener<NewsResultsCubit, BaseState>(
        listener: (context, state) {
          // Update page controller when cubit page changes
          final cubit = context.read<NewsResultsCubit>();
          if (_pageController.text != cubit.currentPage.toString()) {
            _pageController.text = cubit.currentPage.toString();
          }
        },
        child: CustomScrollView(
          slivers: [
            // Search Parameters Summary
            const SliverToBoxAdapter(child: _NewsParametersSummary()),

            // Results Section
            BlocBuilder<NewsResultsCubit, BaseState>(
              builder:
                  (context, state) => _NewsContentSliver(
                    state: state,
                    pageController: _pageController,
                    onShowNewsDetails: _navigateToNewsDetail,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNewsDetail(BuildContext context, News news) {
    final cubit = context.read<NewsResultsCubit>();
    unawaited(
      context.router.push(
        NewsDetailRoute(
          newsId: news.id,
          language: cubit.currentLanguage,
          domain: cubit.currentDomain,
        ),
      ),
    );
  }
}

class _NewsParametersSummary extends StatelessWidget {
  const _NewsParametersSummary();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;
        final theme = Theme.of(context);

        return ResultsParametersPanel(
          title: t.news.results.searchParameters,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          headerBottomSpacing: AppSizes.spaceSm,
          chipSpacing: AppSizes.spaceXs,
          chips: [
            ResultsParameterChip(
              text: 'Domain: ${cubit.currentDomain}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            ResultsParameterChip(
              text:
                  'Language: ${cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN'}',
              backgroundColor: theme.colorScheme.secondaryContainer,
              labelStyle: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
              visualDensity: VisualDensity.compact,
            ),
            if (cubit.keyword != null)
              ResultsParameterChip(
                text: 'Keyword: ${cubit.keyword!}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
            if (cubit.newsCategoryID != null)
              ResultsParameterChip(
                text: 'Category: ${cubit.newsCategoryID!}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
            if (cubit.month != null)
              ResultsParameterChip(
                text: 'Month: ${cubit.month}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
            if (cubit.year != null)
              ResultsParameterChip(
                text: 'Year: ${cubit.year}',
                backgroundColor: theme.colorScheme.secondaryContainer,
                labelStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                visualDensity: VisualDensity.compact,
              ),
          ],
        );
      },
    );
  }
}

class _NewsContentSliver extends StatelessWidget {
  const _NewsContentSliver({
    required this.state,
    required this.pageController,
    required this.onShowNewsDetails,
  });

  final BaseState state;
  final TextEditingController pageController;
  final void Function(BuildContext context, News news) onShowNewsDetails;

  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      final LoadedState<List<News>> loadedState => SliverToBoxAdapter(
        child: NewsResultsSection(
          state: loadedState,
          pageController: pageController,
          onShowNewsDetails: onShowNewsDetails,
        ),
      ),
      final ErrorState errorState => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: errorState.message,
          onRetry: () {
            unawaited(context.read<NewsResultsCubit>().refresh());
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }
}
