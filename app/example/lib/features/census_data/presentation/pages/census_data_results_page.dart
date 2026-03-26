import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:stadata_example/core/constants/app_sizes.dart';
import 'package:stadata_example/core/di/injectable.dart';
import 'package:stadata_example/core/generated/strings.g.dart';
import 'package:stadata_example/features/census_data/presentation/cubit/census_data_results_cubit.dart';
import 'package:stadata_example/features/census_data/presentation/widgets/census_data_card.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/widgets/alice_button.dart';
import 'package:stadata_example/shared/widgets/error_widget.dart';
import 'package:stadata_example/shared/widgets/loading_widget.dart';
import 'package:stadata_example/shared/widgets/results_common_widgets.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusDataResultsPage extends StatelessWidget {
  const CensusDataResultsPage({
    required this.censusID,
    required this.datasetID,
    this.censusAreaID,
    super.key,
  });

  final String censusID;
  final String? censusAreaID;
  final String datasetID;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return BlocProvider(
      create:
          (context) =>
              getIt<CensusDataResultsCubit>()..initialize(
                censusID: censusID,
                censusAreaID: censusAreaID,
                datasetID: datasetID,
              ),
      child: BlocBuilder<CensusDataResultsCubit, BaseState>(
        builder: (context, state) {
          final cubit = context.read<CensusDataResultsCubit>();

          if (state is InitialState && cubit.canLoadData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              unawaited(cubit.loadData());
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(t.censusData.results.title),
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
                    _CensusDataSearchParametersPanel(cubit: cubit),
                    const Gap(AppSizes.spaceLg),
                    _CensusDataMainContent(state: state, cubit: cubit),
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

class _CensusDataSearchParametersPanel extends StatelessWidget {
  const _CensusDataSearchParametersPanel({required this.cubit});

  final CensusDataResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ResultsParametersPanel(
      title: t.censusData.results.searchParameters,
      chips: [
        ResultsParameterChip(
          icon: Icons.event,
          text:
              '${t.censusData.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
        ),
        ResultsParameterChip(
          icon: Icons.location_on,
          text:
              '${t.censusData.parameters.censusArea.replaceAll(' *', '')}: ${cubit.censusAreaID ?? 'All Areas'}',
        ),
        ResultsParameterChip(
          icon: Icons.dataset_outlined,
          text:
              '${t.censusData.parameters.dataset.replaceAll(' *', '')}: ${cubit.datasetID}',
        ),
      ],
    );
  }
}

class _CensusDataMainContent extends StatelessWidget {
  const _CensusDataMainContent({required this.state, required this.cubit});

  final BaseState state;
  final CensusDataResultsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final currentState = state;

    if (currentState is InitialState) {
      return Center(child: Text(t.censusData.results.initializing));
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

    if (currentState is LoadedState<List<CensusData>>) {
      final dataList = currentState.data;

      if (dataList.isEmpty) {
        return ResultsEmptyState(
          icon: Icons.storage_outlined,
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
              t.censusData.results.found(n: dataList.length),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),

          const Gap(AppSizes.spaceMd),

          // List of census data
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataList.length,
            separatorBuilder: (context, index) => const Gap(AppSizes.spaceMd),
            itemBuilder: (context, index) {
              final data = dataList[index];
              return CensusDataCard(data: data);
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
