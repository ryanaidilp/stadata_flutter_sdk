import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/core/generated/strings.g.dart';

class DynamicTablesResultsSection extends StatelessWidget {
  const DynamicTablesResultsSection({required this.state, super.key});

  final BaseState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(AppSizes.spaceMd),
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.table_chart,
                color: theme.colorScheme.primary,
                size: AppSizes.iconMd,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                'Dynamic Table Results',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          Expanded(child: _buildContent(context)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return switch (state) {
      InitialState() => _buildInitialState(context),
      LoadingState() => _buildLoadingState(context),
      LoadedState<List<Period>>() => _buildPeriodsLoadedState(context),
      LoadedState<DynamicTable>() => _buildDynamicTableLoadedState(context),
      ErrorState() => _buildErrorState(context),
      _ => _buildInitialState(context),
    };
  }

  Widget _buildInitialState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.table_chart_outlined,
            size: 64,
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
          ),
          const Gap(AppSizes.spaceMd),
          Text(
            context.t.dynamicTables.results.initial,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const Gap(AppSizes.spaceMd),
          Text(
            'Loading data...',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodsLoadedState(BuildContext context) {
    final theme = Theme.of(context);
    final periodsState = state as LoadedState<List<Period>>;
    final periods = periodsState.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Years (${periods.length} found)',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(AppSizes.spaceMd),
        Expanded(
          child:
              periods.isEmpty
                  ? Center(
                    child: Text(
                      'No periods available for the selected variable',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: periods.length,
                    itemBuilder: (context, index) {
                      final period = periods[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppSizes.spaceXs),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Text(
                              period.id.toString(),
                              style: TextStyle(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          title: Text(
                            period.label,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '${context.t.dynamicTables.results.periodId}: ${period.id}',
                          ),
                        ),
                      );
                    },
                  ),
        ),
        const Gap(AppSizes.spaceMd),
        Container(
          padding: const EdgeInsets.all(AppSizes.spaceSm),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                size: AppSizes.iconSm,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const Gap(AppSizes.spaceXs),
              Expanded(
                child: Text(
                  context.t.dynamicTables.results.periodInitial,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDynamicTableLoadedState(BuildContext context) {
    final theme = Theme.of(context);
    final dynamicTableState = state as LoadedState<DynamicTable>;
    final dynamicTable = dynamicTableState.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dynamic Table Data',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(AppSizes.spaceMd),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Table metadata
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Table Information',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(AppSizes.spaceSm),
                        _buildInfoRow(
                          context,
                          'Data Availability',
                          dynamicTable.dataAvailability.toString(),
                        ),
                        _buildInfoRow(
                          context,
                          'Variables Count',
                          dynamicTable.variables.length.toString(),
                        ),
                        _buildInfoRow(
                          context,
                          'Vertical Variables Count',
                          dynamicTable.verticalVariables.length.toString(),
                        ),
                        _buildInfoRow(
                          context,
                          'Year Periods Count',
                          dynamicTable.yearPeriods.length.toString(),
                        ),
                        _buildInfoRow(
                          context,
                          'Data Content Size',
                          dynamicTable.dataContent.length.toString(),
                        ),
                        if (dynamicTable.verticalVariableLabel != null)
                          _buildInfoRow(
                            context,
                            'Vertical Variable Label',
                            dynamicTable.verticalVariableLabel!,
                          ),
                      ],
                    ),
                  ),
                ),

                const Gap(AppSizes.spaceMd),

                // Data content
                if (dynamicTable.dataContent.isNotEmpty) ...[
                  Text(
                    'Data Content (Key-Value Pairs)',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(AppSizes.spaceSm),
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.all(AppSizes.spaceMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: dynamicTable.dataContent.entries.length,
                      itemBuilder: (context, index) {
                        final entry = dynamicTable.dataContent.entries
                            .elementAt(index);
                        return Card(
                          margin: const EdgeInsets.only(
                            bottom: AppSizes.spaceXs,
                          ),
                          child: ListTile(
                            title: Text(
                              'Key: ${entry.key}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              'Value: ${entry.value}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ] else ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.spaceMd),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.table_chart_outlined,
                              size: 48,
                              color: theme.colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.5),
                            ),
                            const Gap(AppSizes.spaceSm),
                            Text(
                              'No data content available',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final theme = Theme.of(context);
    final errorState = state as ErrorState;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
          const Gap(AppSizes.spaceMd),
          Text(
            'Error Loading Data',
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.error,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(AppSizes.spaceSm),
          Text(
            errorState.message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.spaceXs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Gap(AppSizes.spaceXs),
          Expanded(child: Text(value, style: theme.textTheme.bodySmall)),
        ],
      ),
    );
  }
}
