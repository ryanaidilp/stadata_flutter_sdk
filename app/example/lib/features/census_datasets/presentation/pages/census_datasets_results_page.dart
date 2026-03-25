import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_datasets/presentation/cubit/census_datasets_results_cubit.dart';
import 'package:stadata_example/features/census_datasets/presentation/widgets/census_dataset_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusDatasetsResultsPage extends StatelessWidget {
  const CensusDatasetsResultsPage({
    required this.censusID,
    required this.topicID,
    super.key,
  });

  final String censusID;
  final int topicID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<CensusDatasetsResultsCubit>()
                ..initialize(censusID: censusID, topicID: topicID),
      child: BlocBuilder<CensusDatasetsResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<CensusDatasetsResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.censusDatasets.results.title),
              actions: [
                const AliceButton(),
                IconButton(
                  onPressed: cubit.refresh,
                  icon: const Icon(Icons.refresh),
                  tooltip: t.common.refresh,
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
                    _CensusDatasetsParametersPanel(cubit: cubit),
                    const Gap(AppSizes.spaceLg),
                    _CensusDatasetsMainContent(state: state, cubit: cubit),
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

class _CensusDatasetsParametersPanel extends StatelessWidget {
  const _CensusDatasetsParametersPanel({required this.cubit});

  final CensusDatasetsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.censusDatasets.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.event,
          text:
              '${t.censusDatasets.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
        ),
        ResultsParameterChip(
          icon: Icons.topic_outlined,
          text:
              '${t.censusDatasets.parameters.censusTopic.replaceAll(' *', '')}: ${cubit.topicID}',
        ),
      ],
    );
  }
}

class _CensusDatasetsMainContent extends StatelessWidget {
  const _CensusDatasetsMainContent({required this.state, required this.cubit});

  final BaseState state;
  final CensusDatasetsResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final currentState = state;

    if (currentState is InitialState) {
      return Center(child: Text(t.censusDatasets.results.initializing));
    }

    if (currentState is LoadingState) {
      return const LoadingWidget();
    }

    if (currentState is ErrorState) {
      return ErrorStateWidget(
        message: currentState.message,
        onRetry: cubit.refresh,
      );
    }

    if (currentState is LoadedState<List<CensusDataset>>) {
      final datasets = currentState.data;

      if (datasets.isEmpty) {
        return ResultsEmptyState(
          icon: Icons.dataset_outlined,
          message: t.common.noData,
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with count
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.spaceMd),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              t.censusDatasets.results.found(n: datasets.length),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),

          const Gap(AppSizes.spaceMd),

          // List of datasets
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: datasets.length,
            separatorBuilder: (context, index) => const Gap(AppSizes.spaceMd),
            itemBuilder: (context, index) {
              final dataset = datasets[index];
              return CensusDatasetCard(dataset: dataset);
            },
          ),
        ],
      );
    }

    return Center(
      child: Text(
        t.common.unknownState,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
