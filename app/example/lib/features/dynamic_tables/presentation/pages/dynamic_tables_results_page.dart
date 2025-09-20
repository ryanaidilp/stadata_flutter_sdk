import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_tables_results_cubit.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/widgets/dynamic_tables_request_details_panel.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/widgets/dynamic_tables_results_section.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

@RoutePage()
class DynamicTablesResultsPage extends StatelessWidget {
  const DynamicTablesResultsPage({
    super.key,
    required this.domain,
    required this.language,
    required this.variable,
    required this.yearId,
  });

  final String domain;
  final DataLanguage language;
  final Variable variable;
  final int yearId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<DynamicTablesResultsCubit>()..initialize(
                domain: domain,
                language: language,
                variable: variable,
                yearId: yearId,
              ),
      child: const DynamicTablesResultsView(),
    );
  }
}

class DynamicTablesResultsView extends StatefulWidget {
  const DynamicTablesResultsView({super.key});

  @override
  State<DynamicTablesResultsView> createState() =>
      _DynamicTablesResultsViewState();
}

class _DynamicTablesResultsViewState extends State<DynamicTablesResultsView> {
  bool _showRequestDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.dynamicTables.results.title),
        actions: [
          // Language display
          BlocBuilder<DynamicTablesResultsCubit, BaseState>(
            builder: (context, state) {
              final cubit = context.read<DynamicTablesResultsCubit>();
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
                    ? 'Hide Request Details'
                    : 'Show Request Details',
          ),
          // Refresh button
          BlocBuilder<DynamicTablesResultsCubit, BaseState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed:
                    state is LoadingState
                        ? null
                        : () {
                          context.read<DynamicTablesResultsCubit>().refresh();
                        },
                tooltip: 'Refresh',
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Search Parameters Summary
          SliverToBoxAdapter(child: _buildParametersSummary()),

          // Request Details Panel (if enabled)
          if (_showRequestDetails)
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(AppSizes.spaceMd),
                child: const DynamicTablesRequestDetailsPanel(),
              ),
            ),

          // Results Section
          BlocBuilder<DynamicTablesResultsCubit, BaseState>(
            builder: (context, state) {
              return _buildContentSliver(context, state);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildParametersSummary() {
    return BlocBuilder<DynamicTablesResultsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesResultsCubit>();

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
                    Icons.table_chart,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    'Table Parameters',
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
                  _buildParameterChip(context, 'Domain', cubit.domain),
                  _buildParameterChip(
                    context,
                    'Language',
                    cubit.currentLanguage == DataLanguage.id ? 'ID' : 'EN',
                  ),
                  if (cubit.selectedVariable != null)
                    _buildParameterChip(
                      context,
                      'Variable',
                      cubit.selectedVariable!.title,
                    ),
                  if (cubit.selectedYearId != null)
                    _buildParameterChip(
                      context,
                      'Year ID',
                      cubit.selectedYearId.toString(),
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
      InitialState() => SliverToBoxAdapter(
        child: Center(child: Text(context.t.dynamicTables.states.initializing)),
      ),
      LoadingState() => const SliverToBoxAdapter(child: LoadingWidget()),
      LoadedState<DynamicTable> state => SliverToBoxAdapter(
        child: DynamicTablesResultsSection(state: state),
      ),
      ErrorState state => SliverToBoxAdapter(
        child: ErrorStateWidget(
          message: state.message,
          onRetry: () {
            context.read<DynamicTablesResultsCubit>().refresh();
          },
        ),
      ),
      _ => SliverToBoxAdapter(
        child: Center(child: Text(context.t.dynamicTables.states.unknown)),
      ),
    };
  }
}
