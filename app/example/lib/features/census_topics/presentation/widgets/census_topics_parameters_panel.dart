import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_topics/presentation/cubit/census_topics_cubit.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/parameters_panel.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusTopicsParametersPanel extends StatelessWidget {
  const CensusTopicsParametersPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocBuilder<CensusTopicsCubit, BaseState>(
      builder: (context, state) {
        final cubit = context.read<CensusTopicsCubit>();

        return ParametersPanel(
          icon: Icons.tune,
          title: t.censusTopics.parameters.title,
          children: [
            _CensusTopicsParametersContent(state: state, cubit: cubit),
          ],
        );
      },
    );
  }
}

class _CensusTopicsParametersContent extends StatelessWidget {
  const _CensusTopicsParametersContent({
    required this.state,
    required this.cubit,
  });

  final BaseState state;
  final CensusTopicsCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state is CensusTopicsState) {
      final currentState = state as CensusTopicsState;
      final baseState = currentState.baseState;
      final isLoading = baseState is LoadingState;
      final censusEvents = currentState.censusEvents;

      if (baseState is ErrorState) {
        return ErrorStateWidget(
          message: baseState.message,
          onRetry: cubit.loadCensusEvents,
        );
      }

      return _CensusTopicsParametersForm(
        cubit: cubit,
        censusEvents: censusEvents,
        isLoading: isLoading,
      );
    }

    return _CensusTopicsParametersForm(
      cubit: cubit,
      censusEvents: const [],
      isLoading: true,
    );
  }
}

class _CensusTopicsParametersForm extends StatelessWidget {
  const _CensusTopicsParametersForm({
    required this.cubit,
    required this.censusEvents,
    required this.isLoading,
  });

  final CensusTopicsCubit cubit;
  final List<CensusEvent> censusEvents;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParameterField(
          label: t.censusTopics.parameters.censusEvent,
          child: DropdownButtonFormField<String>(
            initialValue: cubit.censusID,
            isExpanded: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText:
                  isLoading
                      ? 'Loading census events...'
                      : t.censusTopics.parameters.censusEventHint,
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
            onChanged: isLoading ? null : cubit.setCensusID,
          ),
        ),
      ],
    );
  }
}
