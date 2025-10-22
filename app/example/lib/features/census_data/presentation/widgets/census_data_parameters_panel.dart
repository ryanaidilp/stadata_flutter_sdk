import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_data/presentation/cubit/census_data_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDataParametersPanel extends StatefulWidget {
  const CensusDataParametersPanel({super.key});

  @override
  State<CensusDataParametersPanel> createState() =>
      _CensusDataParametersPanelState();
}

class _CensusDataParametersPanelState extends State<CensusDataParametersPanel> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<CensusDataCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<CensusDataCubit>();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.spaceMd),
          decoration: BoxDecoration(
            color: Colors.white,
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
                    Icons.tune,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.censusData.parameters.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Gap(AppSizes.spaceMd),
              _buildContent(context, state, cubit),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    BaseState state,
    CensusDataCubit cubit,
  ) {
    if (state is CensusDataState) {
      final baseState = state.baseState;
      final isLoading = baseState is LoadingState;
      final censusEvents = state.censusEvents;
      final censusTopics = state.censusTopics;
      final censusDatasets = state.censusDatasets;

      if (baseState is ErrorState) {
        return ErrorStateWidget(
          message: baseState.message,
          onRetry: cubit.loadCensusEvents,
        );
      }

      // Show form regardless of loading state
      return _buildForm(
        context,
        cubit,
        censusEvents,
        censusTopics,
        censusDatasets,
        isLoading: isLoading,
      );
    }

    // Show form with loading state for InitialState
    return _buildForm(
      context,
      cubit,
      const [],
      const [],
      const [],
      isLoading: true,
    );
  }

  Widget _buildForm(
    BuildContext context,
    CensusDataCubit cubit,
    List<CensusEvent> censusEvents,
    List<CensusTopic> censusTopics,
    List<CensusDataset> censusDatasets, {
    required bool isLoading,
  }) {
    final t = Translations.of(context);
    final isLoadingTopicsAndAreas =
        isLoading && cubit.censusID != null && censusTopics.isEmpty;
    final isLoadingDatasets =
        isLoading && cubit.topicID != null && censusDatasets.isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Census Event dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusData.parameters.censusEvent,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            DropdownButtonFormField<String>(
              key: ValueKey(cubit.censusID),
              initialValue: cubit.censusID,
              isExpanded: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText:
                    isLoading && censusEvents.isEmpty
                        ? 'Loading census events...'
                        : t.censusData.parameters.censusEventHint,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceSm,
                  vertical: AppSizes.spaceSm,
                ),
              ),
              items:
                  censusEvents.isEmpty
                      ? [
                        DropdownMenuItem<String>(
                          value: null,
                          enabled: false,
                          child: Text(
                            isLoading
                                ? 'Loading...'
                                : 'No census events available',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]
                      : censusEvents.map((event) {
                        return DropdownMenuItem<String>(
                          value: event.id,
                          child: Text(
                            '${event.id} - ${event.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
              onChanged:
                  isLoading && censusEvents.isEmpty ? null : cubit.setCensusID,
            ),
          ],
        ),
        const Gap(AppSizes.spaceMd),

        // Census Topic dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusData.parameters.censusTopic,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            DropdownButtonFormField<int>(
              key: ValueKey('${cubit.censusID}_${cubit.topicID}'),
              initialValue: cubit.topicID,
              isExpanded: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText:
                    isLoadingTopicsAndAreas
                        ? 'Loading census topics...'
                        : !cubit.canLoadTopicsAndAreas
                        ? 'Select census event first'
                        : t.censusData.parameters.censusTopicHint,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceSm,
                  vertical: AppSizes.spaceSm,
                ),
              ),
              items:
                  censusTopics.isEmpty
                      ? [
                        DropdownMenuItem<int>(
                          value: null,
                          enabled: false,
                          child: Text(
                            isLoadingTopicsAndAreas
                                ? 'Loading...'
                                : !cubit.canLoadTopicsAndAreas
                                ? 'Select census event first'
                                : 'No census topics available',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]
                      : censusTopics.map((topic) {
                        return DropdownMenuItem<int>(
                          value: topic.id,
                          child: Text(
                            '${topic.id} - ${topic.topic}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
              onChanged:
                  isLoadingTopicsAndAreas || !cubit.canLoadTopicsAndAreas
                      ? null
                      : cubit.setTopicID,
            ),
          ],
        ),
        const Gap(AppSizes.spaceMd),

        // Census Area searchable dropdown with pagination
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusData.parameters.censusArea,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            SearchableDropdown<CensusArea>.paginated(
              requestItemCount: 10,
              hintText: Text(
                cubit.canLoadTopicsAndAreas
                    ? t.censusData.parameters.censusAreaHint
                    : 'Select census event first',
              ),
              isEnabled: cubit.canLoadTopicsAndAreas,
              paginatedRequest: (page, searchKey) async {
                if (!cubit.canLoadTopicsAndAreas) {
                  return [];
                }
                final areas = await cubit.fetchCensusAreas(
                  page: page,
                  searchText: searchKey,
                );
                return areas
                    .map(
                      (area) => SearchableDropdownMenuItem<CensusArea>(
                        value: area,
                        label: area.name,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            area.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            'ID: ${area.id}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList();
              },
              onChanged: (CensusArea? area) {
                context.read<CensusDataCubit>().setCensusAreaID(
                  area?.id.toString(),
                );
              },
              backgroundDecoration:
                  (child) => Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSm,
                        vertical: AppSizes.spaceXs,
                      ),
                      child: child,
                    ),
                  ),
              margin: EdgeInsets.zero,
            ),
          ],
        ),
        const Gap(AppSizes.spaceMd),

        // Dataset dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusData.parameters.dataset,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            DropdownButtonFormField<String>(
              key: ValueKey(
                '${cubit.censusID}_${cubit.topicID}_${cubit.datasetID}',
              ),
              initialValue: cubit.datasetID,
              isExpanded: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText:
                    isLoadingDatasets
                        ? 'Loading datasets...'
                        : !cubit.canLoadDatasets
                        ? 'Select topic first'
                        : t.censusData.parameters.datasetHint,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceSm,
                  vertical: AppSizes.spaceSm,
                ),
              ),
              items:
                  censusDatasets.isEmpty
                      ? [
                        DropdownMenuItem<String>(
                          value: null,
                          enabled: false,
                          child: Text(
                            isLoadingDatasets
                                ? 'Loading...'
                                : !cubit.canLoadDatasets
                                ? 'Select topic first'
                                : 'No datasets available',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]
                      : censusDatasets.map((dataset) {
                        return DropdownMenuItem<String>(
                          value: dataset.id.toString(),
                          child: Text(
                            '${dataset.id} - ${dataset.name}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
              onChanged:
                  isLoadingDatasets || !cubit.canLoadDatasets
                      ? null
                      : cubit.setDatasetID,
            ),
          ],
        ),
      ],
    );
  }
}
