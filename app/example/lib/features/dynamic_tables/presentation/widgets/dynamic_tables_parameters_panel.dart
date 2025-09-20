import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/features/dynamic_tables/presentation/cubit/dynamic_tables_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';

class DynamicTablesParametersPanel extends StatelessWidget {
  const DynamicTablesParametersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DynamicTablesCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<DynamicTablesCubit>();

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
                    'Dynamic Table Parameters',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),

              // Domain and Language Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Domain',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(AppSizes.spaceXs),
                        TextFormField(
                          initialValue: cubit.domain,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter domain code (e.g., 0000)',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceXs,
                            ),
                          ),
                          onChanged: (value) {
                            cubit.changeDomain(value.trim());
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(AppSizes.spaceMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Language',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(AppSizes.spaceXs),
                        DropdownButtonFormField<DataLanguage>(
                          initialValue: cubit.currentLanguage,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.spaceSm,
                              vertical: AppSizes.spaceXs,
                            ),
                          ),
                          items:
                              DataLanguage.values.map((lang) {
                                return DropdownMenuItem(
                                  value: lang,
                                  child: Text(
                                    lang == DataLanguage.id
                                        ? 'Indonesian'
                                        : 'English',
                                  ),
                                );
                              }).toList(),
                          onChanged: (language) {
                            if (language != null) {
                              cubit.changeLanguage(language);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Variable Selection Info
              Container(
                padding: const EdgeInsets.all(AppSizes.spaceSm),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: AppSizes.iconSm,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const Gap(AppSizes.spaceXs),
                        Text(
                          'Variable Selection',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Gap(AppSizes.spaceXs),
                    if (cubit.selectedVariable == null)
                      Text(
                        'In a real implementation, you would load and select from available variables for the domain. For this demo, manually enter a variable ID.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected: ${cubit.selectedVariable!.title}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'ID: ${cubit.selectedVariable!.id}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),

              const Gap(AppSizes.spaceMd),

              // Manual Variable ID Input
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Variable ID (Demo Input)',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(AppSizes.spaceXs),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter variable ID (e.g., 31)',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceXs,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final variableId = int.tryParse(value.trim());
                      if (variableId != null) {
                        // Create a dummy variable for demo purposes
                        final dummyVariable = Variable(
                          id: variableId,
                          graphName: 'Demo Variable',
                          notes: 'Demo variable for testing',
                          subjectID: 1,
                          subjectName: 'Demo Subject',
                          title: 'Demo Variable $variableId',
                          unit: 'Units',
                          verticalVariableID: 1,
                        );
                        cubit.selectVariable(dummyVariable);
                      }
                    },
                  ),
                ],
              ),

              const Gap(AppSizes.spaceMd),

              // Load Available Years Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed:
                      cubit.canLoadPeriods && state is! LoadingState
                          ? () => cubit.loadAvailablePeriods()
                          : null,
                  icon:
                      state is LoadingState
                          ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                          : const Icon(Icons.access_time),
                  label: Text(
                    state is LoadingState
                        ? 'Loading Available Years...'
                        : 'Load Available Years',
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.spaceSm,
                    ),
                  ),
                ),
              ),

              // Year Selection Dropdown (only show when periods are loaded)
              if (cubit.availablePeriods.isNotEmpty) ...[
                const Gap(AppSizes.spaceMd),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Year',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(AppSizes.spaceXs),
                    DropdownButtonFormField<int>(
                      initialValue: cubit.selectedYearId,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceSm,
                          vertical: AppSizes.spaceSm,
                        ),
                      ),
                      hint: const Text('Select Year'),
                      menuMaxHeight: 300,
                      items:
                          cubit.availablePeriods.map((period) {
                            return DropdownMenuItem<int>(
                              value: period.id,
                              child: Text(period.label),
                            );
                          }).toList(),
                      onChanged: (yearId) {
                        if (yearId != null) {
                          cubit.selectYearId(yearId);
                        }
                      },
                    ),
                    const Gap(AppSizes.spaceXs),
                    Text(
                      'Select the year for the dynamic table data',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],

              // Load Dynamic Table Button
              if (cubit.availablePeriods.isNotEmpty) ...[
                const Gap(AppSizes.spaceMd),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: null, // Disabled - use main page action buttons
                    icon:
                        state is LoadingState
                            ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Icon(Icons.table_chart),
                    label: Text(
                      state is LoadingState
                          ? 'Loading Dynamic Table...'
                          : 'Load Dynamic Table',
                    ),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.spaceSm,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
