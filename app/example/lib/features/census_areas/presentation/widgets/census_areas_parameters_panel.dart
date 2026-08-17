import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_areas/presentation/cubit/census_areas_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusAreasParametersPanel extends StatelessWidget {
  const CensusAreasParametersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<CensusAreasCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<CensusAreasCubit>();

        return ParametersPanel(
          icon: Icons.tune,
          title: t.censusAreas.parameters.title,
          children: [
            _CensusAreasParametersContent(state: state, cubit: cubit),
          ],
        );
      },
    );
  }
}

class _CensusAreasParametersContent extends StatelessWidget {
  const _CensusAreasParametersContent({
    required this.state,
    required this.cubit,
  });

  final BaseState state;
  final CensusAreasCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state is CensusAreasState) {
      final currentState = state as CensusAreasState;
      final baseState = currentState.baseState;
      final isLoading = baseState is LoadingState;
      final censusEvents = currentState.censusEvents;

      if (baseState is ErrorState) {
        return ErrorStateWidget(
          message: baseState.message,
          onRetry: cubit.loadCensusEvents,
        );
      }

      return _CensusAreasParametersForm(
        cubit: cubit,
        censusEvents: censusEvents,
        isLoading: isLoading,
      );
    }

    return _CensusAreasParametersForm(
      cubit: cubit,
      censusEvents: const [],
      isLoading: true,
    );
  }
}

class _CensusAreasParametersForm extends StatelessWidget {
  const _CensusAreasParametersForm({
    required this.cubit,
    required this.censusEvents,
    required this.isLoading,
  });

  final CensusAreasCubit cubit;
  final List<CensusEvent> censusEvents;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isLoadingAreas = isLoading && cubit.censusID != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParameterField(
          label: t.censusAreas.parameters.censusEvent,
          child: DropdownButtonFormField<String>(
            key: ValueKey(cubit.censusID),
            initialValue: cubit.censusID,
            isExpanded: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText:
                  isLoading && censusEvents.isEmpty
                      ? 'Loading census events...'
                      : t.censusAreas.parameters.censusEventHint,
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
        ),
        const Gap(AppSizes.spaceMd),
        if (isLoadingAreas)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.spaceMd),
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
