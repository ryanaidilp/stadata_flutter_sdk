import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_topics/presentation/cubit/census_topics_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusTopicsParametersPanel extends StatelessWidget {
  const CensusTopicsParametersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<CensusTopicsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<CensusTopicsCubit>();

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
                    t.censusTopics.parameters.title,
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
    CensusTopicsCubit cubit,
  ) {
    if (state is CensusTopicsState) {
      final baseState = state.baseState;

      if (baseState is LoadingState) {
        return const LoadingWidget();
      }

      if (baseState is ErrorState) {
        return ErrorStateWidget(
          message: baseState.message,
          onRetry: cubit.loadCensusEvents,
        );
      }

      if (baseState is LoadedState<List<CensusEvent>>) {
        return _buildForm(context, cubit, state.censusEvents);
      }
    }

    return const SizedBox.shrink();
  }

  Widget _buildForm(
    BuildContext context,
    CensusTopicsCubit cubit,
    List<CensusEvent> censusEvents,
  ) {
    final t = Translations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Census Event dropdown
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusTopics.parameters.censusEvent,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            DropdownButtonFormField<String>(
              initialValue: cubit.censusID,
              isExpanded: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: t.censusTopics.parameters.censusEventHint,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceSm,
                  vertical: AppSizes.spaceSm,
                ),
              ),
              items:
                  censusEvents.map((event) {
                    return DropdownMenuItem<String>(
                      value: event.id,
                      child: Text(
                        '${event.id} - ${event.name}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
              onChanged: cubit.setCensusID,
            ),
          ],
        ),
        const Gap(AppSizes.spaceMd),

        // Language selector
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.censusTopics.parameters.language,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const Gap(AppSizes.spaceXs),
            SegmentedButton<DataLanguage>(
              segments: const [
                ButtonSegment<DataLanguage>(
                  value: DataLanguage.id,
                  label: Text('ID'),
                  icon: Icon(Icons.language),
                ),
                ButtonSegment<DataLanguage>(
                  value: DataLanguage.en,
                  label: Text('EN'),
                  icon: Icon(Icons.language),
                ),
              ],
              selected: {cubit.currentLanguage},
              onSelectionChanged: (Set<DataLanguage> selected) {
                cubit.changeLanguage(selected.first);
              },
            ),
          ],
        ),
      ],
    );
  }
}
