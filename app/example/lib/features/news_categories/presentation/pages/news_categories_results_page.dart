import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/news_categories/presentation/cubit/news_categories_results_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/features/news_categories/presentation/widgets/news_categories_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class NewsCategoriesResultsPage extends StatelessWidget {
  const NewsCategoriesResultsPage({
    required this.domain,
    required this.language,
    super.key,
  });

  final String domain;
  final DataLanguage language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<NewsCategoriesResultsCubit>()
                ..initialize(domain: domain, language: language),
      child: const NewsCategoriesResultsView(),
    );
  }
}

class NewsCategoriesResultsView extends StatefulWidget {
  const NewsCategoriesResultsView({super.key});

  @override
  State<NewsCategoriesResultsView> createState() =>
      _NewsCategoriesResultsViewState();
}

class _NewsCategoriesResultsViewState extends State<NewsCategoriesResultsView> {
  @override
  Widget build(BuildContext context) {
    final t = LocaleSettings.instance.currentTranslations;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.newsCategories.results.title),
        actions: [
          // Language display
          BlocBuilder<NewsCategoriesResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<NewsCategoriesResultsCubit>();
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
          BlocBuilder<NewsCategoriesResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<NewsCategoriesResultsCubit>().refresh();
                        },
                tooltip: t.common.refresh,
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Search Parameters Summary
          SliverToBoxAdapter(child: _buildParametersSummary()),

          // Results Section
          BlocBuilder<NewsCategoriesResultsCubit, BaseState>(
            builder: _buildContentSliver,
          ),
        ],
      ),
    );
  }

  Widget _buildParametersSummary() {
    return BlocBuilder<NewsCategoriesResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<NewsCategoriesResultsCubit>();
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
                    t.newsCategories.results.searchParameters,
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
      final LoadedState<List<NewsCategory>> state => SliverToBoxAdapter(
        child: NewsCategoriesResultsSection(
          state: state,
          onShowCategoryDetails: _showCategoryDetails,
        ),
      ),
      final ErrorState state => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: state.message,
          onRetry: () {
            context.read<NewsCategoriesResultsCubit>().refresh();
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(t.common.unknownState)),
      ),
    };
  }

  void _showCategoryDetails(BuildContext context, NewsCategory category) {
    final t = LocaleSettings.instance.currentTranslations;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder:
                (context, scrollController) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.spaceLg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Handle bar
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant
                                    .withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          const Gap(AppSizes.spaceLg),

                          // Header
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppSizes.spaceSm),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.category,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onPrimaryContainer,
                                ),
                              ),
                              const Gap(AppSizes.spaceMd),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.newsCategories.categoryDetail.title,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Gap(AppSizes.spaceXs),
                                    Text(
                                      category.name,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium?.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const Gap(AppSizes.spaceLg),

                          // Details
                          _buildDetailRow(
                            context,
                            t.newsCategories.categoryDetail.id,
                            category.id,
                          ),
                          _buildDetailRow(
                            context,
                            t.newsCategories.categoryDetail.name,
                            category.name,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
