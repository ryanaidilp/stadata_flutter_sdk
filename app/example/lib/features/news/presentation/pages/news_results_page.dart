import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/news/presentation/cubit/news_results_cubit.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_results_request_details_panel.dart';
import 'package:stadata_example/features/news/presentation/widgets/news_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';

@RoutePage()
class NewsResultsPage extends StatelessWidget {
  const NewsResultsPage({
    super.key,
    required this.domain,
    required this.language,
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
  bool _showRequestDetails = false;
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
          // Request details toggle
          IconButton(
            icon: Icon(_showRequestDetails ? Icons.code_off : Icons.code),
            onPressed: () {
              setState(() {
                _showRequestDetails = !_showRequestDetails;
              });
            },
            tooltip:
                _showRequestDetails
                    ? t.news.requestDetails.hideDetails
                    : t.news.requestDetails.showDetails,
          ),
          // Refresh button
          BlocBuilder<NewsResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<NewsResultsCubit>().refresh();
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
            SliverToBoxAdapter(child: _buildParametersSummary()),

            // Request Details Panel (if enabled)
            if (_showRequestDetails)
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(AppSizes.spaceMd),
                  child: const NewsResultsRequestDetailsPanel(),
                ),
              ),

            // Results Section
            BlocBuilder<NewsResultsCubit, BaseState>(
              builder: (context, state) {
                return _buildContentSliver(context, state);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParametersSummary() {
    return BlocBuilder<NewsResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsResultsCubit>();
        final t = LocaleSettings.instance.currentTranslations;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(AppSizes.spaceMd),
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.news.results.searchParameters,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceSm),
              Wrap(
                spacing: AppSizes.spaceXs,
                runSpacing: AppSizes.spaceXs,
                children: [
                  _buildParameterChip(context, 'Domain', cubit.currentDomain),
                  _buildParameterChip(
                    context,
                    'Language',
                    cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                  ),
                  if (cubit.keyword != null)
                    _buildParameterChip(context, 'Keyword', cubit.keyword!),
                  if (cubit.newsCategoryID != null)
                    _buildParameterChip(
                      context,
                      'Category',
                      cubit.newsCategoryID!,
                    ),
                  if (cubit.month != null)
                    _buildParameterChip(
                      context,
                      'Month',
                      cubit.month.toString(),
                    ),
                  if (cubit.year != null)
                    _buildParameterChip(context, 'Year', cubit.year.toString()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildParameterChip(BuildContext context, String label, String value) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildContentSliver(BuildContext context, BaseState state) {
    return switch (state) {
      InitialState() => const SliverToBoxAdapter(
        child: Center(child: Text('Initializing...')),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      LoadedState<List<News>> state => SliverToBoxAdapter(
        child: NewsResultsSection(
          state: state,
          pageController: _pageController,
          onShowNewsDetails: _navigateToNewsDetail,
        ),
      ),
      ErrorState state => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: state.message,
          onRetry: () {
            context.read<NewsResultsCubit>().refresh();
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }

  void _navigateToNewsDetail(BuildContext context, News news) {
    final cubit = context.read<NewsResultsCubit>();
    context.router.push(
      NewsDetailRoute(
        newsId: news.id,
        language: cubit.currentLanguage,
        domain: cubit.currentDomain,
      ),
    );
  }
}
