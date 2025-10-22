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
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@RoutePage()
class CensusDataResultsPage extends StatelessWidget {
  const CensusDataResultsPage({
    required this.censusID,
    this.censusAreaID,
    required this.datasetID,
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
              cubit.loadData();
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
                    _buildSearchParametersPanel(context, cubit),
                    const Gap(AppSizes.spaceLg),
                    _buildMainContent(context, state, cubit),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchParametersPanel(
    BuildContext context,
    CensusDataResultsCubit cubit,
  ) {
    final t = Translations.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.spaceMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Gap(AppSizes.spaceXs),
              Text(
                t.censusData.results.searchParameters,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(AppSizes.spaceMd),
          Wrap(
            spacing: AppSizes.spaceSm,
            runSpacing: AppSizes.spaceXs,
            children: [
              Chip(
                avatar: const Icon(Icons.event, size: 16),
                label: Text(
                  '${t.censusData.parameters.censusEvent.replaceAll(' *', '')}: ${cubit.censusID}',
                ),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.location_on, size: 16),
                label: Text(
                  '${t.censusData.parameters.censusArea.replaceAll(' *', '')}: ${cubit.censusAreaID ?? 'All Areas'}',
                ),
                padding: EdgeInsets.zero,
              ),
              Chip(
                avatar: const Icon(Icons.dataset_outlined, size: 16),
                label: Text(
                  '${t.censusData.parameters.dataset.replaceAll(' *', '')}: ${cubit.datasetID}',
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    BaseState state,
    CensusDataResultsCubit cubit,
  ) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    if (state is InitialState) {
      return Center(child: Text(t.censusData.results.initializing));
    }

    if (state is LoadingState) {
      return const LoadingWidget();
    }

    if (state is ErrorState) {
      return ErrorStateWidget(message: state.message, onRetry: cubit.refresh);
    }

    if (state is LoadedState<List<CensusData>>) {
      final dataList = state.data;

      if (dataList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.storage_outlined,
                size: 64,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const Gap(AppSizes.spaceMd),
              Text(
                t.common.noData,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
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
