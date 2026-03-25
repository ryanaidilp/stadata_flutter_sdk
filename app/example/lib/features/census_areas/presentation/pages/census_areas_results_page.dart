import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_areas/presentation/cubit/census_areas_results_cubit.dart';
import 'package:stadata_example/features/census_areas/presentation/widgets/census_area_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusAreasResultsPage extends StatelessWidget {
  const CensusAreasResultsPage({required this.censusID, super.key});

  final String censusID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) => getIt<CensusAreasResultsCubit>()..censusID = censusID,
      child: BlocBuilder<CensusAreasResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<CensusAreasResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.censusAreas.results.title),
              actions: const [AliceButton()],
            ),
            body: Column(
              children: [
                _CensusAreasParametersInfo(cubit: cubit),
                const Gap(AppSizes.spaceMd),
                Expanded(
                  child: _CensusAreasContent(state: state, cubit: cubit),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CensusAreasParametersInfo extends StatelessWidget {
  const _CensusAreasParametersInfo({required this.cubit});

  final CensusAreasResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return ResultsParametersPanel(
      title: t.censusAreas.results.searchParameters,
      icon: null,
      backgroundColor: theme.colorScheme.surfaceContainerLowest,
      borderRadius: BorderRadius.zero,
      border: Border(
        bottom: BorderSide(color: theme.colorScheme.outlineVariant),
      ),
      headerBottomSpacing: AppSizes.spaceXs,
      titleStyle: theme.textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      chips: [
        ResultsParameterChip(
          icon: Icons.event,
          text:
              '${t.censusAreas.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
        ),
      ],
    );
  }
}

class _CensusAreasContent extends StatelessWidget {
  const _CensusAreasContent({required this.state, required this.cubit});

  final BaseState state;
  final CensusAreasResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final currentState = state;

    if (currentState is LoadingState) {
      return const LoadingWidget();
    }

    if (currentState is ErrorState) {
      return ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.loadData,
      );
    }

    if (currentState is LoadedState<List<CensusArea>>) {
      final areas = currentState.data;

      if (areas.isEmpty) {
        return const ResultsEmptyState(message: 'No census areas found');
      }

      return RefreshIndicator(
        onRefresh: cubit.refresh,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceMd,
                vertical: AppSizes.spaceSm,
              ),
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Gap(AppSizes.spaceXs),
                  Text(
                    t.censusAreas.results.found(n: areas.length),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSizes.spaceMd),
                itemCount: areas.length,
                separatorBuilder:
                    (context, index) => const Gap(AppSizes.spaceMd),
                itemBuilder: (context, index) {
                  final area = areas[index];
                  return CensusAreaCard(area: area);
                },
              ),
            ),
          ],
        ),
      );
    }

    return Center(child: Text(t.censusAreas.results.initializing));
  }
}
