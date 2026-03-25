import 'dart:async';
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
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
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
              unawaited(cubit.loadData());
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
                    _StaticTablesParametersPanel(cubit: cubit),

                    const Gap(AppSizes.spaceLg),

                    // Main content based on state
                    _StaticTablesMainContent(
                      state: state,
                      cubit: cubit,
                      defaultDomain: domain,
                    ),

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
                          unawaited(cubit.loadData(page: index + 1));
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
}

class _StaticTablesParametersPanel extends StatelessWidget {
  const _StaticTablesParametersPanel({required this.cubit});

  final StaticTablesResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ResultsParametersPanel(
      title: 'Search Parameters',
      headerBottomSpacing: AppSizes.spaceSm,
      chips: [
        ResultsParameterChip(
          icon: Icons.domain,
          text: 'Domain: ${cubit.domain ?? '-'}',
        ),
        ResultsParameterChip(
          icon: Icons.language,
          text:
              'Language: ${cubit.currentLanguage == DataLanguage.id ? 'Indonesian' : 'English'}',
        ),
        if (cubit.keyword != null)
          ResultsParameterChip(
            icon: Icons.search,
            text: 'Keyword: ${cubit.keyword!}',
          ),
        if (cubit.month != null)
          ResultsParameterChip(
            icon: Icons.calendar_month,
            text: 'Month: ${_getStaticTablesMonthName(cubit.month!)}',
          ),
        if (cubit.year != null)
          ResultsParameterChip(
            icon: Icons.calendar_today,
            text: 'Year: ${cubit.year}',
          ),
      ],
    );
  }
}

class _StaticTablesMainContent extends StatelessWidget {
  const _StaticTablesMainContent({
    required this.state,
    required this.cubit,
    required this.defaultDomain,
  });

  final BaseState state;
  final StaticTablesResultsCubit cubit;
  final String defaultDomain;

  @override
  Widget build(BuildContext context) {
    final currentState = state;

    return switch (currentState) {
      LoadingState() => const LoadingWidget(),
      LoadedState<List<StaticTable>>() =>
        currentState.data.isNotEmpty
            ? _StaticTablesResultsList(
              staticTables: currentState.data,
              cubit: cubit,
              defaultDomain: defaultDomain,
            )
            : const EmptyStateWidget(
              message: 'No static tables found',
              icon: Icons.table_chart_outlined,
            ),
      ErrorState() => ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      ),
      _ => const EmptyStateWidget(
        message: 'Enter search parameters to load static tables',
        icon: Icons.table_chart_outlined,
      ),
    };
  }
}

class _StaticTablesResultsList extends StatelessWidget {
  const _StaticTablesResultsList({
    required this.staticTables,
    required this.cubit,
    required this.defaultDomain,
  });

  final List<StaticTable> staticTables;
  final StaticTablesResultsCubit cubit;
  final String defaultDomain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        ...staticTables.asMap().entries.map((entry) {
          final index = entry.key;
          final staticTable = entry.value;

          return Column(
            children: [
              StaticTableCard(
                staticTable: staticTable,
                onViewTable: () {
                  unawaited(
                    context.router.push(
                      StaticTableDetailRoute(
                        id: staticTable.id,
                        domain: cubit.domain ?? defaultDomain,
                        language: cubit.currentLanguage,
                      ),
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
}

String _getStaticTablesMonthName(int month) {
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
