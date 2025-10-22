import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_datasets/presentation/cubit/census_datasets_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDatasetsParametersPanel extends StatelessWidget {
  const CensusDatasetsParametersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<CensusDatasetsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<CensusDatasetsCubit>();

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
                    t.censusDatasets.parameters.title,
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
    CensusDatasetsCubit cubit,
  ) {
    if (state is CensusDatasetsState) {
      final baseState = state.baseState;
      final isLoading = baseState is LoadingState;
      final censusEvents = state.censusEvents;
      final censusTopics = state.censusTopics;

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
        isLoading: isLoading,
      );
    }

    // Show form with loading state for InitialState
    return _buildForm(context, cubit, const [], const [], isLoading: true);
  }

  Widget _buildForm(
    BuildContext context,
    CensusDatasetsCubit cubit,
    List<CensusEvent> censusEvents,
    List<CensusTopic> censusTopics, {
    required bool isLoading,
  }) {
    final t = Translations.of(context);
    final isLoadingTopics =
        isLoading && cubit.censusID != null && censusTopics.isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Census Event dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusDatasets.parameters.censusEvent,
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
                        : t.censusDatasets.parameters.censusEventHint,
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
              t.censusDatasets.parameters.censusTopic,
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
                    isLoadingTopics
                        ? 'Loading census topics...'
                        : !cubit.canLoadTopics
                        ? 'Select census event first'
                        : t.censusDatasets.parameters.censusTopicHint,
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
                            isLoadingTopics
                                ? 'Loading...'
                                : !cubit.canLoadTopics
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
                  isLoadingTopics || !cubit.canLoadTopics
                      ? null
                      : cubit.setTopicID,
            ),
          ],
        ),
      ],
    );
  }
}
