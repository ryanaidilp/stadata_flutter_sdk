import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/navigation/app_router.dart';
import 'package:stadata_example/features/static_tables/presentation/cubit/static_tables_results_cubit.dart';
import 'package:stadata_example/features/static_tables/presentation/widgets/static_table_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class StaticTablesResultsPage extends StatelessWidget {
  const StaticTablesResultsPage({
    required this.domain,
    required this.language,
    this.keyword,
    this.month,
    this.year,
    super.key,
  });

  final String domain;
  final DataLanguage language;
  final String? keyword;
  final int? month;
  final int? year;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<StaticTablesResultsCubit>()..initialize(
                domain: domain,
                language: language,
                keyword: keyword,
                month: month,
                year: year,
              ),
      child: BlocBuilder<StaticTablesResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<StaticTablesResultsCubit>();

          // Auto-load data when widget is first built and in initial state
          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              cubit.loadData();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Static Tables Results'),
              actions: [
                // Alice inspector button (debug only)
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: cubit.refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search parameters summary
                    _buildSearchParametersPanel(context, cubit),

                    const Gap(AppSizes.spaceLg),

                    // Main content based on state
                    _buildMainContent(context, state, cubit),

                    // Pagination controls - only show when we have data
                    if (state is LoadedState<List<StaticTable>> &&
                        state.data.isNotEmpty &&
                        cubit.totalPages > 1) ...[
                      const Gap(AppSizes.spaceLg),
                      NumberPaginator(
                        key: ValueKey(cubit.currentPage),
                        numberPages: cubit.totalPages,
                        initialPage: cubit.currentPage - 1,
                        onPageChange: (index) {
                          cubit.loadData(page: index + 1);
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchParametersPanel(
    BuildContext context,
    StaticTablesResultsCubit cubit,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
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
                'Search Parameters',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceSm),
          _buildParameterRow(context, 'Domain', cubit.domain ?? '-'),
          _buildParameterRow(
            context,
            'Language',
            cubit.currentLanguage == DataLanguage.id ? 'Indonesian' : 'English',
          ),
          if (cubit.keyword != null)
            _buildParameterRow(context, 'Keyword', cubit.keyword!),
          if (cubit.month != null)
            _buildParameterRow(context, 'Month', _getMonthName(cubit.month!)),
          if (cubit.year != null)
            _buildParameterRow(context, 'Year', cubit.year.toString()),
        ],
      ),
    );
  }

  Widget _buildParameterRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    BaseState state,
    StaticTablesResultsCubit cubit,
  ) {
    return switch (state) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<StaticTable>>() =>
        state.data.isNotEmpty
            ? _buildResultsList(context, state.data, cubit)
            : const EmptyStateWidget(
              message: 'No static tables found',
              icon: Icons.table_chart_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: state.message,
        onRetry: () => cubit.refresh(),
      ),
      _ => const EmptyStateWidget(
        message: 'Enter search parameters to load static tables',
        icon: Icons.table_chart_outlined,
      ),
    };
  }

  Widget _buildResultsList(
    BuildContext context,
    List<StaticTable> staticTables,
    StaticTablesResultsCubit cubit,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Results header
        Row(
          children: [
            Icon(
              Icons.table_chart,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Gap(AppSizes.spaceXs),
            Text(
              'Results',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Gap(AppSizes.spaceSm),

        // Results count
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceSm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Found ${staticTables.length} static tables',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),

        const Gap(AppSizes.spaceMd),

        // Static tables list
        ...staticTables.asMap().entries.map((entry) {
          final index = entry.key;
          final staticTable = entry.value;

          return Column(
            children: [
              StaticTableCard(
                staticTable: staticTable,
                onViewTable: () {
                  context.router.push(
                    StaticTableDetailRoute(
                      id: staticTable.id,
                      domain: cubit.domain ?? domain,
                      language: cubit.currentLanguage,
                    ),
                  );
                },
              ),
              if (index < staticTables.length - 1) const Gap(AppSizes.spaceMd),
            ],
          );
        }),
      ],
    );
  }

  String _getMonthName(int month) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthNames[month - 1];
  }
}
